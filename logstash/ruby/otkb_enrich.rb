def concurrency
  :shared
end

require 'faraday'
require 'json'
require 'time'

##############################################################################################
# The fixture and its refresh state are global so every clone of this filter in this Logstash
# process reads the same immutable snapshot. A different Logstash process has its own snapshot.
$otkb_json_fixture ||= Concurrent::AtomicReference.new(nil)
$otkb_json_fixture_refresh_mutex ||= Mutex.new
$otkb_json_fixture_retry_after ||= Concurrent::AtomicReference.new(0.0)

##############################################################################################
# These global variables generate optional performance profiling stats for OTKB API calls.
$otkb_timings_logging_thread_started ||= Concurrent::AtomicFixnum.new(0)
$otkb_timings ||= Concurrent::Map.new
$otkb_timings_logging_thread ||= nil
$otkb_timings_logging_thread_running ||= false

##############################################################################################
# Zeek serializes IEC 60870-5-104 ASDU type IDs using the symbolic enum names
# below, while OTKB rules use their numeric values.
# Adapted from https://github.com/cert-lv/spicy-iec104/blob/main/scripts/iec104.zeek
OTKB_IEC104_TYPE_IDS = {
  'ASDU_TYPEUNDEF' => '0',
  'M_SP_NA_1' => '1',
  'M_SP_TA_1' => '2',
  'M_DP_NA_1' => '3',
  'M_DP_TA_1' => '4',
  'M_ST_NA_1' => '5',
  'M_ST_TA_1' => '6',
  'M_BO_NA_1' => '7',
  'M_BO_TA_1' => '8',
  'M_ME_NA_1' => '9',
  'M_ME_TA_1' => '10',
  'M_ME_NB_1' => '11',
  'M_ME_TB_1' => '12',
  'M_ME_NC_1' => '13',
  'M_ME_TC_1' => '14',
  'M_IT_NA_1' => '15',
  'M_IT_TA_1' => '16',
  'M_EP_TA_1' => '17',
  'M_EP_TB_1' => '18',
  'M_EP_TC_1' => '19',
  'M_PS_NA_1' => '20',
  'M_ME_ND_1' => '21',
  'M_SP_TB_1' => '30',
  'M_DP_TB_1' => '31',
  'M_ST_TB_1' => '32',
  'M_BO_TB_1' => '33',
  'M_ME_TD_1' => '34',
  'M_ME_TE_1' => '35',
  'M_ME_TF_1' => '36',
  'M_IT_TB_1' => '37',
  'M_EP_TD_1' => '38',
  'M_EP_TE_1' => '39',
  'M_EP_TF_1' => '40',
  'C_SC_NA_1' => '45',
  'C_DC_NA_1' => '46',
  'C_RC_NA_1' => '47',
  'C_SE_NA_1' => '48',
  'C_SE_NB_1' => '49',
  'C_SE_NC_1' => '50',
  'C_BO_NA_1' => '51',
  'C_SC_TA_1' => '58',
  'C_DC_TA_1' => '59',
  'C_RC_TA_1' => '60',
  'C_SE_TA_1' => '61',
  'C_SE_TB_1' => '62',
  'C_SE_TC_1' => '63',
  'C_BO_TA_1' => '64',
  'M_EI_NA_1' => '70',
  'C_IC_NA_1' => '100',
  'C_CI_NA_1' => '101',
  'C_RD_NA_1' => '102',
  'C_CS_NA_1' => '103',
  'C_TS_NA_1' => '104',
  'C_RP_NA_1' => '105',
  'C_CD_NA_1' => '106',
  'C_TS_TA_1' => '107',
  'P_ME_NA_1' => '110',
  'P_ME_NB_1' => '111',
  'P_ME_NC_1' => '112',
  'P_AC_NA_1' => '113',
  'F_FR_NA_1' => '120',
  'F_SR_NA_1' => '121',
  'F_SC_NA_1' => '122',
  'F_LS_NA_1' => '123',
  'F_AF_NA_1' => '124',
  'F_SG_NA_1' => '125',
  'F_DR_TA_1' => '126',
  'F_SC_NB_1' => '127'
}.freeze

##############################################################################################
class OtkbConnLazy
  def initialize(
    url,
    token,
    ssl_verify,
    debug
  )
    @object = nil
    @url = url
    @token = token
    @ssl_verify = ssl_verify
    @conn_debug = debug
    @connected = false
  end

  def method_missing(method, *args, &block)
    puts "#{method}(#{args.map(&:inspect).join(', ')})" if @conn_debug

    if $otkb_timings_logging_thread_running
      key = "#{method} #{args[0]}".to_sym
      start_time = Time.now
    end

    initialize_object unless @object
    result = @object.send(method, *args, &block)

    if $otkb_timings_logging_thread_running
      duration = (Time.now - start_time) * 1000
      $otkb_timings.compute_if_absent(key) { Concurrent::Array.new } << duration
    end

    @connected ||= !result.nil?
    result
  end

  def respond_to_missing?(method, include_private = false)
    initialize_object unless @object
    @object.respond_to?(method, include_private) || super
  end

  def initialized?
    !@object.nil? && @connected
  end

  private

  def initialize_object
    @object = Faraday.new(@url, ssl: { verify: @ssl_verify }) do |conn|
      unless @token.nil? || @token.to_s.empty?
        conn.request :authorization, 'Token', @token
      end
      conn.request :url_encoded
      conn.response :json
      conn.response :raise_error
    end
    @connected = false
  end
end

##############################################################################################
# Evaluates the rule objects stored in zeek_rules and wireshark_rules.
class OtkbRuleEngine
  def match?(rule, event_data)
    !match_score(rule, event_data).nil?
  end

  # Return the number of leaf conditions in the matching path. A nil score means the rule did not
  # match. The score lets the filter prefer a narrower match when several functions match an event.
  def match_score(rule, event_data)
    case rule
    when Hash
      if rule.key?('and')
        match_all(rule['and'], event_data)
      elsif rule.key?('or')
        match_any(rule['or'], event_data)
      else
        match_single_rule(rule, event_data) ? 1 : nil
      end
    when Array
      match_all(rule, event_data)
    else
      nil
    end
  end

  private

  def match_all(rules, event_data)
    return nil unless rules.is_a?(Array) && !rules.empty?

    total = 0
    rules.each do |subrule|
      score = match_score(subrule, event_data)
      return nil if score.nil?

      total += score
    end
    total
  end

  def match_any(rules, event_data)
    return nil unless rules.is_a?(Array) && !rules.empty?

    best = nil
    rules.each do |subrule|
      score = match_score(subrule, event_data)
      best = score if !score.nil? && (best.nil? || score > best)
    end
    best
  end

  def match_single_rule(rule, event_data)
    field_path = rule['field']
    return false unless field_path.is_a?(String) && !field_path.empty?

    if rule.key?('log')
      log_type = normalize_log_name(rule['log'])
      field_path = "#{log_type}.#{field_path}"
    end

    value = dig_field(event_data, field_path)
    return false if value.nil?

    return rule_values_equal?(value, rule['eq']) if rule.key?('eq')

    begin
      numeric_value = Float(value)
      if rule.key?('gte') && rule.key?('lte')
        return numeric_value >= Float(rule['gte']) && numeric_value <= Float(rule['lte'])
      end

      return numeric_value >= Float(rule['gte']) if rule.key?('gte')
      return numeric_value <= Float(rule['lte']) if rule.key?('lte')
    rescue ArgumentError, TypeError
      return false
    end

    false
  end

  def comparable_integer(string)
    if string.match?(/\A0[xX][0-9a-fA-F]+\z/)
      Integer(string[2..], 16)
    elsif string.match?(/\A[+-]?\d+\z/)
      Integer(string, 10)
    end
  rescue ArgumentError, TypeError
    nil
  end

  def rule_values_equal?(actual, expected)
    actual_string = actual.to_s.strip
    expected_string = expected.to_s.strip

    return true if actual_string.casecmp?(expected_string)

    actual_integer = comparable_integer(actual_string)
    expected_integer = comparable_integer(expected_string)

    !actual_integer.nil? &&
      !expected_integer.nil? &&
      actual_integer == expected_integer
  end

  def normalize_log_name(value)
    value.to_s.sub(/\.log\z/, '').tr('-', '_').sub(/_general\z/, '')
  end

  def dig_field(hash, field_path)
    field_path.split('.').reduce(hash) do |value, key|
      value.is_a?(Hash) ? value[key] : nil
    end
  end
end

##############################################################################################
def register(
  params
)
  # Enable or disable the filter using a script parameter or global environment variable.
  _enabled_str = params['enabled']
  _enabled_env = params['enabled_env']
  if _enabled_str.nil? && !_enabled_env.nil?
    _enabled_str = ENV[_enabled_env]
  end
  @otkb_enabled = [1, true, '1', 'true', 't', 'on', 'enabled'].include?(_enabled_str.to_s.downcase)

  # Refresh the complete fixture after this many seconds. Zero loads it once per process.
  _cache_ttl_val = integer_or_nil(params['cache_ttl'])
  _cache_ttl_env = params['cache_ttl_env']
  if (_cache_ttl_val.nil? || _cache_ttl_val.negative?) && !_cache_ttl_env.nil?
    _cache_ttl_val = integer_or_nil(ENV[_cache_ttl_env])
  end
  @cache_ttl = if !_cache_ttl_val.nil? && _cache_ttl_val >= 0
                 _cache_ttl_val
               else
                 300
               end

  _debug_str = params['debug']
  _debug_env = params['debug_env']
  if _debug_str.nil? && !_debug_env.nil?
    _debug_str = ENV[_debug_env]
  end
  @debug_verbose = ['verbose', 'v', 'extra'].include?(_debug_str.to_s.downcase)
  @debug = @debug_verbose || [1, true, '1', 'true', 't', 'on', 'enabled'].include?(_debug_str.to_s.downcase)

  _debug_timings_str = params['debug_timings']
  _debug_timings_env = params['debug_timings_env']
  if _debug_timings_str.nil? && !_debug_timings_env.nil?
    _debug_timings_str = ENV[_debug_timings_env]
  end
  @debug_timings = [1, true, '1', 'true', 't', 'on', 'enabled'].include?(_debug_timings_str.to_s.downcase)

  # OTKB API base URL, specified directly or read from an environment variable.
  @otkb_url = params['otkb_url'].to_s.delete_suffix('/')
  _otkb_url_env = params['otkb_url_env'].to_s
  if @otkb_url.empty? && !_otkb_url_env.empty?
    @otkb_url = ENV[_otkb_url_env].to_s.delete_suffix('/')
  end
  @otkb_url = nil if @otkb_url.empty?

  # OTKB API token, specified directly or read from the first populated environment variable.
  @otkb_token = params['otkb_token']
  _otkb_token_env = params['otkb_token_env']
  if @otkb_token.nil? && !_otkb_token_env.nil?
    @otkb_token = _otkb_token_env.split(/[;,:\s]+/)
                                 .map { |env| ENV[env].to_s }
                                 .find { |value| !value.strip.empty? }
  end

  _ssl_verify_str = params['ssl_verify']
  _ssl_verify_env = params['ssl_verify_env']
  if _ssl_verify_str.nil? && !_ssl_verify_env.nil?
    _ssl_verify_str = ENV[_ssl_verify_env]
  end
  @otkb_ssl_verify = [1, true, '1', 'true', 't', 'on'].include?(_ssl_verify_str.to_s.downcase)

  @otkb_conn = OtkbConnLazy.new(
    "#{@otkb_url}/",
    @otkb_token,
    @otkb_ssl_verify,
    @debug_verbose
  ) unless @otkb_url.nil?
  @otkb_rule_engine = OtkbRuleEngine.new

  if @debug_timings &&
     $otkb_timings_logging_thread_started.value == 0 &&
     $otkb_timings_logging_thread_started.compare_and_set(0, 1)
    $otkb_timings_logging_thread = Thread.new { log_otkb_timings_thread_proc }
    $otkb_timings_logging_thread_running = true
  end
end

##############################################################################################
def filter(
  event
)
  return [event] unless @otkb_enabled
  return [event] if @otkb_conn.nil?

  _event_data = event.get('[zeek]')
  if _event_data.is_a?(Hash)
    _parser = :zeek
    _rule_field = 'zeek_rules'
  else
    _event_data = event.get('[wireshark]')
    return [event] unless _event_data.is_a?(Hash)

    _parser = :wireshark
    _rule_field = 'wireshark_rules'
  end

  _protocol_name = event.get('[network][protocol]')
  _protocol_name = _protocol_name.first if _protocol_name.is_a?(Array)
  return [event] unless _protocol_name.is_a?(String) && !_protocol_name.empty?

  # This call returns the current snapshot and refreshes it from sync/json-fixture/ when its TTL
  # has expired. A failed refresh leaves the previous snapshot available to this event.
  _fixture = get_otkb_json_fixture
  return [event] if _fixture.nil?

  _protocol_name_normalized = normalize_index_key(_protocol_name)

  _protocol = _fixture['protocol_by_name'][_protocol_name_normalized]
  return [event] unless _protocol.is_a?(Hash)

  # Adapt Zeek's IEC 104 log-specific objects to the numeric path and value
  # representation used by the OTKB fixture rules:
  #
  #   Zeek: iec104_telemetry.asdu_type = "M_SP_NA_1"
  #   OTKB: iec104.info_obj_type       = "1"
  if _parser == :zeek && _protocol_name_normalized == 'iec104'
    _dataset = event.get('[event][dataset]')
    _dataset = _dataset.first if _dataset.is_a?(Array)

    if _dataset.is_a?(String)
      _iec104_data = _event_data[normalize_log_name(_dataset)]

      if _iec104_data.is_a?(Hash) && !_iec104_data['asdu_type'].nil?
        _event_data = _event_data.dup
        _event_data['iec104'] = {
          'info_obj_type' =>
            normalize_iec104_type_id(_iec104_data['asdu_type'])
        }
      end
    end
  end

  _functions = _fixture['functions_by_protocol'].fetch(_protocol['id'], [])

  _matches = []
  _functions.each do |function|
    next unless function.is_a?(Hash)

    rule = function[_rule_field]
    next if rule.nil?

    begin
      score = @otkb_rule_engine.match_score(rule, _event_data)
    rescue StandardError => error
      puts "Invalid OTKB rule for function #{function['id']}: #{error.class}: #{error.message}" if @debug
      next
    end
    _matches << { 'function' => function, 'score' => score } unless score.nil?
  end

  if _matches.empty?
    puts "No OTKB #{_parser} match for protocol #{_protocol_name}" if @debug_verbose
    return [event]
  end

  # Prefer the matching rule with the most satisfied leaf conditions. Sort equal scores by UUID
  # so fixture ordering cannot change which function is selected.
  _match = _matches.min_by do |candidate|
    [-candidate['score'], candidate['function']['id'].to_s]
  end
  _function = _match['function']

  event.set('[otkb][function]', enrich_otkb_function(_function, _fixture))
  event.set('[otkb][protocol]', enrich_otkb_citations(_protocol, _fixture))

  _procedures = _fixture['procedures_by_function'].fetch(_function['id'], [])
  unless _procedures.empty?
    _enriched_procedures = _procedures.map { |procedure| enrich_otkb_procedure(procedure, _fixture) }
    event.set('[otkb][procedures]', _enriched_procedures)
    enrich_threat_from_otkb_procedures(event, _enriched_procedures)
  end

  puts "Matched OTKB function #{_function['id']} (#{_function['name']}) with score #{_match['score']}" if @debug_verbose

  [event]
end

##############################################################################################
def enrich_otkb_function(function, fixture)
  enriched = enrich_otkb_citations(function, fixture)

  classifier = otkb_fixture_record(fixture, 'otkb.otkbclass', function['otkb_classifier'])
  if classifier.nil?
    enriched.delete('otkb_classifier')
  else
    enriched['otkb_classifier'] = deep_copy(classifier)
  end

  notes = fixture['function_notes_by_function'].fetch(function['id'], [])
  enriched['notes'] = deep_copy(notes) unless notes.empty?
  enriched
end

##############################################################################################
def enrich_otkb_procedure(procedure, fixture)
  enriched = enrich_otkb_citations(procedure, fixture)
  {
    'asset' => 'otkb.asset',
    'software' => 'otkb.software',
    'campaign' => 'otkb.campaign'
  }.each_pair do |field, collection|
    related = otkb_fixture_record(fixture, collection, procedure[field])
    if related.nil?
      enriched.delete(field)
    else
      enriched[field] = enrich_otkb_citations(related, fixture)
    end
  end
  enriched
end

##############################################################################################
def enrich_otkb_citations(record, fixture)
  enriched = deep_copy(record)
  return enriched unless record.is_a?(Hash) && record['citations'].is_a?(Array)

  enriched['citations'] = record['citations'].map do |citation|
    if citation.is_a?(Hash)
      deep_copy(citation)
    else
      found = otkb_fixture_record(fixture, 'otkb.citation', citation)
      deep_copy(found) unless found.nil?
    end
  end.compact
  enriched
end

##############################################################################################
def otkb_fixture_record(fixture, collection, id)
  return nil if id.nil? || id.to_s.empty?

  collection_index = fixture.fetch('by_id', {}).fetch(collection, {})
  collection_index[id]
end

##############################################################################################
def enrich_threat_from_otkb_procedures(event, procedures)
  threat = event.get('[threat]')
  threat = threat.is_a?(Hash) ? deep_copy(threat) : {}
  matched_attack_id = false

  procedures.each do |procedure|
    attack_id = procedure['attack_id'].to_s
    case attack_id
    when /\ATA\d+\z/
      append_unique_nested_value(threat, ['tactic', 'id'], attack_id)
      append_unique_nested_value(
        threat,
        ['tactic', 'reference'],
        "https://attack.mitre.org/tactics/#{attack_id}/"
      )
      matched_attack_id = true
    when /\AT\d+\.\d+\z/
      technique_id, subtechnique_id = attack_id.split('.', 2)
      append_unique_nested_value(threat, ['technique', 'id'], technique_id)
      append_unique_nested_value(
        threat,
        ['technique', 'reference'],
        "https://attack.mitre.org/techniques/#{technique_id}/"
      )
      append_unique_nested_value(threat, ['technique', 'subtechnique', 'id'], attack_id)
      append_unique_nested_value(
        threat,
        ['technique', 'subtechnique', 'reference'],
        "https://attack.mitre.org/techniques/#{technique_id}/#{subtechnique_id}/"
      )
      matched_attack_id = true
    when /\AT\d+\z/
      append_unique_nested_value(threat, ['technique', 'id'], attack_id)
      append_unique_nested_value(
        threat,
        ['technique', 'reference'],
        "https://attack.mitre.org/techniques/#{attack_id}/"
      )
      matched_attack_id = true
    end
  end

  if matched_attack_id
    threat['framework'] = 'MITRE ATT&CK for ICS'
    event.set('[threat]', threat)
  end
end

##############################################################################################
def append_unique_nested_value(hash, path, value)
  parent = path[0...-1].reduce(hash) do |current, key|
    current[key] = {} unless current[key].is_a?(Hash)
    current[key]
  end
  leaf = path.last
  values = Array(parent[leaf]).compact
  values << value unless values.include?(value)
  parent[leaf] = values
end

##############################################################################################
def get_otkb_json_fixture
  _now = monotonic_time
  _fixture = $otkb_json_fixture.get
  _fixture = nil unless otkb_json_fixture_source_matches?(_fixture)
  return _fixture if otkb_json_fixture_fresh?(_fixture, _now)
  return _fixture if _now < $otkb_json_fixture_retry_after.get

  $otkb_json_fixture_refresh_mutex.synchronize do
    _now = monotonic_time
    _fixture = $otkb_json_fixture.get
    _fixture = nil unless otkb_json_fixture_source_matches?(_fixture)
    return _fixture if otkb_json_fixture_fresh?(_fixture, _now)
    return _fixture if _now < $otkb_json_fixture_retry_after.get

    # Avoid retrying the API for every event when the initial load or a refresh fails.
    _retry_delay = @cache_ttl.zero? ? 60 : [[@cache_ttl, 60].min, 1].max
    $otkb_json_fixture_retry_after.set(_now + _retry_delay)

    begin
      _response = @otkb_conn.get('sync/json-fixture/') do |request|
        request.options.open_timeout = 5
        request.options.timeout = 30
      end
      raise Faraday::Error, "OTKB fixture request returned HTTP #{_response.status}" unless _response.success?

      _snapshot = build_otkb_json_fixture_snapshot(_response.body, _now)
      $otkb_json_fixture.set(_snapshot)
      $otkb_json_fixture_retry_after.set(0.0)
      puts "Loaded OTKB JSON fixture version #{_snapshot['version']} generated at #{_snapshot['generated_at']}" if @debug
      _snapshot
    rescue Faraday::Error, JSON::ParserError, ArgumentError, TypeError => error
      puts "OTKB JSON fixture refresh failed: #{error.class}: #{error.message}" if @debug
      _fixture
    end
  end
end

##############################################################################################
def otkb_json_fixture_source_matches?(fixture)
  fixture.is_a?(Hash) && fixture['source_url'] == @otkb_url
end

##############################################################################################
def otkb_json_fixture_fresh?(fixture, now)
  return false unless otkb_json_fixture_source_matches?(fixture)
  return true if @cache_ttl.zero?

  loaded_at = fixture['_loaded_at_monotonic']
  loaded_at.is_a?(Numeric) && (now - loaded_at) < @cache_ttl
end

##############################################################################################
def build_otkb_json_fixture_snapshot(response_body, loaded_at_monotonic)
  body = response_body.is_a?(String) ? JSON.parse(response_body) : response_body
  raise TypeError, 'OTKB JSON fixture response must be an object' unless body.is_a?(Hash)

  collections = body['data']
  raise TypeError, 'OTKB JSON fixture data must be an object' unless collections.is_a?(Hash)

  normalize_otkb_protocol_transports!(collections.fetch('otkb.protocol', []))
  normalize_otkb_attack_ids!(collections)

  by_id = {}
  collections.each_pair do |collection_name, records|
    raise TypeError, "OTKB fixture collection #{collection_name} must be an array" unless records.is_a?(Array)

    by_id[collection_name] = records.each_with_object({}) do |record, index|
      next unless record.is_a?(Hash)

      id = record['id']
      index[id] = record unless id.nil? || id.to_s.empty?
    end
  end

  protocols = collections.fetch('otkb.protocol', [])
  functions = collections.fetch('otkb.function', [])
  function_notes = collections.fetch('otkb.functionnote', [])
  procedures = collections.fetch('otkb.procedure', [])

  protocol_by_name = {}
  protocols.each do |protocol|
    next unless protocol.is_a?(Hash)

    ([protocol['name']] + Array(protocol['alternate_names'])).compact.each do |name|
      key = normalize_index_key(name)
      protocol_by_name[key] ||= protocol unless key.empty?
    end
  end

  functions_by_protocol = group_records_by_field(functions, 'protocol')
  function_notes_by_function = group_records_by_field(function_notes, 'function')
  procedures_by_function = group_records_by_field(procedures, 'function')

  functions_by_zeek_log = Hash.new { |hash, key| hash[key] = [] }
  functions.each do |function|
    next unless function.is_a?(Hash)

    rule_values(function['zeek_rules'], 'log').map { |log_name| normalize_log_name(log_name) }.uniq.each do |log_name|
      functions_by_zeek_log[log_name] << function unless log_name.empty?
    end
  end
  functions_by_zeek_log.default = nil

  loaded_at = Time.now.utc
  snapshot = {
    'version' => body['version'],
    'generated_at' => body['generated_at'],
    'loaded_at' => loaded_at.iso8601(6),
    'source_url' => @otkb_url.dup,
    'collections' => collections,
    'by_id' => by_id,
    'protocol_by_name' => protocol_by_name,
    'functions_by_protocol' => functions_by_protocol,
    'functions_by_zeek_log' => functions_by_zeek_log,
    'function_notes_by_function' => function_notes_by_function,
    'procedures_by_function' => procedures_by_function,
    '_loaded_at_monotonic' => loaded_at_monotonic
  }

  deep_freeze(snapshot)
end

##############################################################################################
def group_records_by_field(records, field)
  index = Hash.new { |hash, key| hash[key] = [] }
  records.each do |record|
    next unless record.is_a?(Hash)

    value = record[field]
    index[value] << record unless value.nil? || value.to_s.empty?
  end
  index.default = nil
  index
end

##############################################################################################
def rule_values(rule, key, values = [])
  case rule
  when Hash
    values << rule[key] if rule.key?(key)
    rule.each_value { |value| rule_values(value, key, values) }
  when Array
    rule.each { |value| rule_values(value, key, values) }
  end
  values.compact
end

##############################################################################################
def normalize_log_name(value)
  value.to_s.sub(/\.log\z/, '').tr('-', '_').sub(/_general\z/, '')
end

##############################################################################################
def normalize_iec104_type_id(value)
  return nil if value.nil?

  string = value.to_s

  type_id = OTKB_IEC104_TYPE_IDS[string]
  return type_id unless type_id.nil?

  # Zeek represents reserved or unnamed values as ASDU_TYPE_<number>.
  match = /\AASDU_TYPE_(\d{1,3})\z/.match(string)
  return value if match.nil?

  numeric_type_id = Integer(match[1], 10)
  return numeric_type_id.to_s if numeric_type_id.between?(0, 255)

  value
rescue ArgumentError, TypeError
  value
end

##############################################################################################
def normalize_otkb_protocol_transports!(protocols)
  protocols.each do |protocol|
    next unless protocol.is_a?(Hash)

    Array(protocol['transport']).each do |transport|
      next unless transport.is_a?(Hash)

      value = transport['protocol']
      transport['protocol'] = value.strip.downcase if value.is_a?(String)
    end
  end
end

##############################################################################################
def normalize_otkb_attack_ids!(collections)
  [
    'otkb.procedure',
    'otkb.asset',
    'otkb.software',
    'otkb.campaign'
  ].each do |collection_name|
    Array(collections[collection_name]).each do |record|
      next unless record.is_a?(Hash)

      attack_id = record['attack_id']
      if attack_id.nil? || (attack_id.is_a?(String) && attack_id.strip.empty?)
        record.delete('attack_id')
      end
    end
  end
end

##############################################################################################
def normalize_index_key(value)
  value.to_s.strip.downcase
end

##############################################################################################
def monotonic_time
  Process.clock_gettime(Process::CLOCK_MONOTONIC)
end

##############################################################################################
def integer_or_nil(value)
  return value if value.is_a?(Integer)

  Integer(value, exception: false)
end


##############################################################################################
def log_otkb_timings_thread_proc
  while $otkb_timings_logging_thread_running
    sleep 60
    puts 'Method Execution Timings ---------------- :'
    $otkb_timings.each do |method, times|
      total_time = times.empty? ? 0 : times.sum
      avg_time = times.empty? ? 0 : total_time / times.size
      puts "#{method}: total #{total_time.round(2)} ms, avg #{avg_time.round(2)} ms over #{times.size} calls"
    end
  end
end

##############################################################################################
def deep_freeze(object)
  case object
  when Hash
    object.each_pair do |key, value|
      deep_freeze(key)
      deep_freeze(value)
    end
  when Array
    object.each { |value| deep_freeze(value) }
  end
  object.freeze
end

##############################################################################################
def deep_copy(object)
  Marshal.load(Marshal.dump(object))
end
