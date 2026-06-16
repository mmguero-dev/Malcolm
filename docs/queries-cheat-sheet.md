# <a name="SearchCheatSheet"></a>Search Queries in Arkime and OpenSearch Dashboards

OpenSearch Dashboards supports two query syntaxes: the legacy [Lucene](https://lucene.apache.org/core/10_4_0/queryparser/org/apache/lucene/queryparser/classic/package-summary.html#query-parser-syntax-heading) syntax and [Dashboards Query Language (DQL)](https://docs.opensearch.org/latest/dashboards/dql/), both of which are somewhat different than [Arkime's query syntax](#ArkimeQueries). The Arkime interface is for searching and visualizing both Arkime sessions and Zeek logs. The prebuilt dashboards in the OpenSearch Dashboards interface are for searching and visualizing Zeek logs, but will not include Arkime sessions. Here are some common patterns used in building search query strings for Arkime and OpenSearch Dashboards, respectively. See the links provided for further documentation.

| | [Arkime Search String](#ArkimeQueries) | [OpenSearch Dashboards Search String (Lucene)](https://lucene.apache.org/core/10_4_0/queryparser/org/apache/lucene/queryparser/classic/package-summary.html#query-parser-syntax-heading) | [OpenSearch Dashboards Search String (DQL)](https://docs.opensearch.org/latest/dashboards/dql/)|
|---|:---:|:---:|:---:|
| Field exists |`event.dataset == EXISTS!`|`_exists_:event.dataset`|`event.dataset:*`|
| Field does not exist |`event.dataset != EXISTS!`|`NOT _exists_:event.dataset`|`NOT event.dataset:*`|
| Field matches a value |`port.dst == 22`|`destination.port:22`|`destination.port:22`|
| Field does not match a value |`port.dst != 22`|`NOT destination.port:22`|`NOT destination.port:22`|
| Field matches at least one of a list of values |`tags == [foo, bar]`|`tags:(foo OR bar)`|`tags:(foo or bar)`|
| Field range (inclusive) |`http.statuscode >= 200 && http.statuscode <= 300`|`http.statuscode:[200 TO 300]`|`http.statuscode >= 200 and http.statuscode <= 300`|
| Field range (exclusive) |`http.statuscode > 200 && http.statuscode < 300`|`http.statuscode:{200 TO 300}`|`http.statuscode > 200 and http.statuscode < 300`|
| Field range (mixed exclusivity) |`http.statuscode >= 200 && http.statuscode < 300`|`http.statuscode:[200 TO 300}`|`http.statuscode >= 200 and http.statuscode < 300`|
| Match all search terms (AND) |`(tags == [foo, bar]) && (http.statuscode == 401)`|`tags:(foo OR bar) AND http.statuscode:401`|`tags:(foo or bar) and http.statuscode:401`|
| Match any search terms (OR) |`(zeek.ftp.password == EXISTS!) || (zeek.http.password == EXISTS!) || (related.user == "anonymous")`|`_exists_:zeek.ftp.password OR _exists_:zeek.http.password OR related.user:"anonymous"`|`zeek.ftp.password:* or zeek.http.password:* or related.user:"anonymous"`|
| Global string search (anywhere in the document) |all Arkime search expressions are field-based|`microsoft`|`microsoft`|
| Wildcards|`host.dns == "*micro?oft*"` (`?` for single character, `*` for any characters)|`dns.host:*micro?oft*` (`?` for single character, `*` for any characters)|`dns.host:*micro*ft*` (`*` for any characters)|
| Regex |`host.http == /.*www\.f.*k\.com.*/`|`zeek.http.host:/.*www\.f.*k\.com.*/`|DQL does not support regex|
| IPv4 values |`ip == 0.0.0.0/0`|`source.ip:"0.0.0.0/0" OR destination.ip:"0.0.0.0/0"`|`source.ip:"0.0.0.0/0" OR destination.ip:"0.0.0.0/0"`|
| IPv6 values |`(ip.src == EXISTS! || ip.dst == EXISTS!) && (ip != 0.0.0.0/0)`|`(_exists_:source.ip AND NOT source.ip:"0.0.0.0/0") OR (_exists_:destination.ip AND NOT destination.ip:"0.0.0.0/0")`|`(source.ip:* and not source.ip:"0.0.0.0/0") or (destination.ip:* and not destination.ip:"0.0.0.0/0")`|
| GeoIP information available |`country == EXISTS!`|`_exists_:destination.geo OR _exists_:source.geo`|`destination.geo:* or source.geo:*`|
| Zeek log type |`event.dataset == notice`|`event.dataset:notice`|`event.dataset:notice`|
| IP CIDR Subnets |`ip.src == 172.16.0.0/12`|`source.ip:"172.16.0.0/12"`|`source.ip:"172.16.0.0/12"`|
| Search time frame |Use Arkime time bounding controls under the search bar|Use OpenSearch Dashboards time range controls in the upper right-hand corner|Use OpenSearch Dashboards time range controls in the upper right-hand corner|

When building complex queries, users are strongly recommended to enclose search terms and expressions in parentheses to control order of operations.

As Zeek logs are ingested, Malcolm parses and normalizes the logs' fields to match Arkime's underlying OpenSearch schema. A complete list of these fields can be found in the Arkime help (accessible at **https://localhost/arkime/help#fields** if connecting locally).

Whenever possible, Zeek fields are mapped to existing corresponding Arkime fields: for example, the `orig_h` field in Zeek is mapped to Arkime's `source.ip` field. The original Zeek fields are also left intact. To complicate the issue, the Arkime interface uses its own aliases to reference those fields: the source IP field is referenced as `ip.src` (Arkime's alias) in Arkime and `source.ip` or `source.ip` in OpenSearch Dashboards.

The table below shows the mapping of some of these fields.

| Field Description |Arkime Field Alias(es)|Arkime-mapped Zeek Field(s)|Zeek Field(s)|
|---|:---:|:---:|:---:|
| [Community ID](https://github.com/corelight/community-id-spec) Flow Hash ||`network.community_id`|`network.community_id`|
| Destination IP |`ip.dst`|`destination.ip`|`destination.ip`|
| Destination MAC |`mac.dst`|`destination.mac`|`destination.mac`|
| Destination Port |`port.dst`|`destination.port`|`destination.port`|
| Duration |`session.length`|`length`|`zeek.conn.duration`|
| First Packet Time |`starttime`|`firstPacket`|`zeek.ts`, `@timestamp`|
| IP Protocol |`ip.protocol`|`ipProtocol`|`network.transport`|
| Last Packet Time |`stoptime`|`lastPacket`||
| MIME Type |`email.bodymagic`, `http.bodymagic`|`http.bodyMagic`|`file.mime_type`, `zeek.files.mime_type`, `zeek.ftp.mime_type`, `zeek.http.orig_mime_types`, `zeek.http.resp_mime_types`, `zeek.irc.dcc_mime_type`|
| Protocol/Service |`protocols`|`protocol`|`network.transport`, `network.protocol`|
| Request Bytes |`databytes.src`, `bytes.src`|`source.bytes`, `client.bytes`|`zeek.conn.orig_bytes`, `zeek.conn.orig_ip_bytes`|
| Request Packets |`packets.src`|`source.packets`|`zeek.conn.orig_pkts`|
| Response Bytes |`databytes.dst`, `bytes.dst`|`destination.bytes`, `server.bytes`|`zeek.conn.resp_bytes`, `zeek.conn.resp_ip_bytes`|
| Response Packets |`packets.dst`|`destination.packets`|`zeek.con.resp_pkts`|
| Source IP |`ip.src`|`source.ip`|`source.ip`|
| Source MAC |`mac.src`|`source.mac`|`source.mac`|
| Source Port |`port.src`|`source.port`|`source.port`|
| Total Bytes |`databytes`, `bytes`|`totDataBytes`, `network.bytes`||
| Total Packets |`packets`|`network.packets`||
| Username |`user`|`user`|`related.user`|
| Zeek Connection UID|||`zeek.uid`, `event.id`|
| Zeek File UID |||`zeek.fuid`, `event.id`|
| Zeek Log Type |||`event.dataset`|

In addition to the fields listed above, Arkime provides several special field aliases for matching any field of a particular type. While these aliases do not exist in OpenSearch Dashboards *per se*, they can be approximated as illustrated below.

| Matches Any | Arkime Special Field Example | OpenSearch Dashboards/Zeek Equivalent Example |
|---|:---:|:---:|
| IP Address | `ip == 192.168.0.1` | `source.ip:192.168.0.1 OR destination.ip:192.168.0.1` |
| Port | `port == [80, 443, 8080, 8443]` | `source.port:(80 OR 443 OR 8080 OR 8443) OR destination.port:(80 OR 443 OR 8080 OR 8443)` |
| Country (code) | `country == [RU,CN]` | `destination.geo.country_code2:(RU OR CN) OR source.geo.country_code2:(RU OR CN) OR dns.GEO:(RU OR CN)` |
| Country (name) | | `destination.geo.country_name:(Russia OR China) OR source.geo.country_name:(Russia OR China)` |
| ASN | `asn == "*Mozilla*"` | `source.as.full:*Mozilla* OR destination.as.full:*Mozilla* OR dns.ASN:*Mozilla*` |
| Host | `host == www.microsoft.com` | `zeek.http.host:www.microsoft.com (or zeek.dhcp.host_name, zeek.dns.host, zeek.ntlm.host, smb.host, etc.)` |
| Protocol (layers >= 4) | `protocols == tls` | `protocol:tls` |
| User | `user == EXISTS! && user != anonymous` | `_exists_:user AND (NOT user:anonymous)` |

For details on how to filter both Zeek logs and Arkime session records for a particular connection, see [Correlating Zeek logs and Arkime sessions](arkime.md#ZeekArkimeFlowCorrelation).

# <a name="ArkimeQueries"></a>Arkime Query Syntax

This section comes from the [Arkime viewer `Help.vue` source file](https://github.com/arkime/arkime/blob/main/viewer/vueapp/src/components/help/Help.vue), and can be found at **https://localhost/arkime/help#search** if connecting locally.

## 🔍 Basic Query

Searches are done using field names, operators, and values. This is sometimes also called a search expression (e.g. `ip.src == 1.2.3.4`).

**Grouping**
You can use parentheses to group search terms (e.g. `field1==value1 && (field2==value2 || field3==value3)`).

**Logical Operators**
Combine search terms using AND (`&&`) and OR (`||`).

**OR List Queries**
Search for ANY of the listed values in a field using square brackets and comma-separated values (e.g. `field==[value1,value2,value3]`).

**AND List Queries**
Search for ALL of the listed values in a field using reversed square brackets (e.g. `field==]value1,value2,value3[`).

---

## 🔍 String Search

In Arkime, string fields are special since they can be searched in several different ways. When fields are indexed, their case may or may not be normalized, which is documented in the fields table. The types of string searches are:

**Wildcard**
If a `*` appears in an expression, it is assumed a wildcard match is being used. Supported wildcards are `*`, which matches any character sequence (including the empty one), and `?`, which matches any single character. The wildcard query is run against the full text strings, after case normalization if enabled for the field. For example `http.uri == "www.f*k.com"` will capture an http.uri string which contains either www.fork.com or www.frack.com.

**Regex**
A regex query must be surrounded by forward slashes and will always be anchored. This means you will almost always want to include a leading and trailing `.*` within your regex query. The regex query is run against the full text strings, after case normalization (if enabled) for the field. For example `http.uri == /.*www\.f.*k\.com.*/`. It uses the Lucene regex implementation which doesn't support most PCRE features. See the [ES Regexp Syntax](https://www.elastic.co/guide/en/elasticsearch/reference/current/regexp-syntax.html) guide.

**OR Lists**
In Arkime, OR Lists are used as a shorthand method for doing multiple OR queries. A list containing wildcard or regex strings will process as wildcard/regexes. For example instead of `(protocols == http || protocols == s*)` use `protocols == [http,s*]`. This query will search for any sessions where the protocols field contains either the exact 'http' value OR values starting with 's'. Using an OR List many times can be faster for the system to process than using `||`.

**AND Lists**
In Arkime, AND Lists are used as a shorthand method for doing multiple AND queries. A list containing wildcard or regex strings will process as wildcard/regexes. For example instead of `(protocols == http && protocols == s*)` use `protocols == ]http,s*[`. This query will search for any sessions where the protocols field contains both the exact 'http' value AND a value starting with 's'. Using an AND List many times can be faster for the system to process than using `&&`.

---

## 🔍 IP Search

IP searching is very flexible and can be performed using the full IP address, a partial IP address, or CIDR representation. For fields that include a port number, it is possible to follow any of the IP representations with a colon (ip4) or dot (ip6) and then the port number to further refine a query. Ports are also first class searchable and may be searched for directly. For example: `ip == 1.2.3.0/24:80`. This query will search for all sessions which contain an IP address within the 1.2.3.0/24 CIDR range as well as utilizing port 80 during the session.

An IP search can also be done with a list of IPs which may be in mixed representations; both OR Lists and AND Lists are supported: `ip == [1.2.3.4,5.6.7.8,1.3.0.0/16]`

If you only want to find ipv4 or ipv6 traffic, you can search using those tokens: `ip.src == ipv6`

---

## 🔍 Numeric Search

Numeric fields support simple range operators besides the default equals and not equals query types. For example, to show events with bytes transferred being less than 10000, use this query: `bytes <= 10000`. Numeric fields also support both OR Lists and AND Lists. For example: `port == [80,443,23]`

---

## 🔍 Date Search

Date fields support simple range operators besides the default equals and not equals. For example: `starttime == "2004/07/31 05:33:41"`. They also support both OR Lists and AND Lists for simple OR/AND queries. For example: `stoptime == ["2004/07/31 05:33:41","2004/07/31 06:33:41"]`. However, usually it's much easier to use the time bounding controls under the search bar.

> **IMPORTANT:** Using `starttime` or `stoptime` does **NOT** change the overall time bounding of the query.

Finally, relative dates and optional snapping are supported using the Splunk syntax:

- Begin the string with a plus (`+`) or minus (`-`) to indicate the offset from the current time.
- Define the time amount with a number and a unit. The supported time units are:
  - **second:** `s`, `sec`, `secs`, `second`, `seconds`
  - **minute:** `m`, `min`, `minute`, `minutes`
  - **hour:** `h`, `hr`, `hrs`, `hour`, `hours`
  - **day:** `d`, `day`, `days`
  - **week:** `w`, `week`, `weeks`
  - **month:** `mon`, `month`, `months`
  - **quarter:** `q`, `qtr`, `qtrs`, `quarter`, `quarters`
  - **year:** `y`, `yr`, `yrs`, `year`, `years`
- Optionally, specify a "snap to" time unit that indicates the nearest or latest time to which the time amount rounds down. Separate the time amount from the "snap to" time unit with an `@` character.

---

## 🔍 Field Exists Search

It is possible to check if a field has been set or not in the session by using the special comparison value of `field == EXISTS!` or negated: `field != EXISTS!`. For example, to verify that a certificate doesn't have an issuer common name, but does have an issuer organizational name, the following query could be used:

```
cert.issuer.cn != EXISTS! && cert.issuer.on == EXISTS!
```

# <a name="DashboardsQueries"></a>OpenSearch Dashboards Query Syntax

## <a name="DashboardsQueriesDQL"></a>Dashboards Query Language (DQL)

## <a name="DashboardsQueriesLucene"></a>Apache Lucene Query Parser Syntax

This section is taken from the [`apache/lucene` source code repository](https://github.com/apache/lucene/blob/main/lucene/queryparser/src/java/org/apache/lucene/queryparser/classic/package-info.java).

### Lucene Query Parser Syntax

#### Table of Contents

- [Overview](#lucene-overview)
- [Terms](#lucene-terms)
- [Fields](#lucene-fields)
- [Term Modifiers](#lucene-term-modifiers)
  - [Wildcard Searches](#lucene-wildcard-searches)
  - [Regular Expression Searches](#lucene-regular-expression-searches)
  - [Fuzzy Searches](#lucene-fuzzy-searches)
  - [Proximity Searches](#lucene-proximity-searches)
  - [Range Searches](#lucene-range-searches)
  - [Boosting a Term](#lucene-boosting-a-term)
- [Boolean Operators](#lucene-boolean-operators)
  - [OR](#lucene-or)
  - [AND](#lucene-and)
  - [Required (`+`)](#lucene-required-)
  - [NOT](#lucene-not)
  - [Prohibit (`-`)](#lucene-prohibit--)
- [Grouping](#lucene-grouping)
- [Field Grouping](#lucene-field-grouping)
- [Escaping Special Characters](#lucene-escaping-special-characters)

---

<a name="lucene-overview"></a>
#### Overview

Although Lucene provides the ability to create your own queries through its API, it also provides a rich query language through the Query Parser, a lexer which interprets a string into a Lucene Query using JavaCC.

Generally, the query parser syntax may change from release to release. This page describes the syntax as of the current release. If you are using a different version of Lucene, please consult the copy of `docs/queryparsersyntax.html` that was distributed with the version you are using.

Before choosing to use the provided Query Parser, please consider the following:

1. If you are programmatically generating a query string and then parsing it with the query parser then you should seriously consider building your queries directly with the query API. In other words, the query parser is designed for human-entered text, not for program-generated text.
2. Untokenized fields are best added directly to queries, and not through the query parser. If a field's values are generated programmatically by the application, then so should query clauses for this field. An analyzer, which the query parser uses, is designed to convert human-entered text to terms. Program-generated values, like dates, keywords, etc., should be consistently program-generated.
3. In a query form, fields which are general text should use the query parser. All others, such as date ranges, keywords, etc. are better added directly through the query API. A field with a limited set of values, that can be specified with a pull-down menu should not be added to a query string which is subsequently parsed, but rather added as a TermQuery clause.

---

<a name="lucene-terms"></a>
#### Terms

A query is broken up into terms and operators. There are two types of terms: Single Terms and Phrases.

A **Single Term** is a single word such as `test` or `hello`.

A **Phrase** is a group of words surrounded by double quotes such as `"hello dolly"`.

Multiple terms can be combined together with Boolean operators to form a more complex query (see below).

> **Note:** The analyzer used to create the index will be used on the terms and phrases in the query string. So it is important to choose an analyzer that will not interfere with the terms used in the query string.

---

<a name="lucene-fields"></a>
#### Fields

Lucene supports fielded data. When performing a search you can either specify a field, or use the default field. The field names and default field is implementation specific.

You can search any field by typing the field name followed by a colon `:` and then the term you are looking for.

As an example, let's assume a Lucene index contains two fields, `title` and `text`, and `text` is the default field. If you want to find the document entitled "The Right Way" which contains the text "don't go this way", you can enter:

```
title:"The Right Way" AND text:go
```

or

```
title:"The Right Way" AND go
```

Since `text` is the default field, the field indicator is not required.

> **Note:** The field is only valid for the term that it directly precedes, so the query
> ```
> title:The Right Way
> ```
> will only find `The` in the title field. It will find `Right` and `Way` in the default field (in this case the text field).

---

<a name="lucene-term-modifiers"></a>
#### Term Modifiers

Lucene supports modifying query terms to provide a wide range of searching options.

<a name="lucene-wildcard-searches"></a>
##### Wildcard Searches

Lucene supports single and multiple character wildcard searches within single terms (not within phrase queries).

- To perform a **single character** wildcard search use the `?` symbol.
- To perform a **multiple character** wildcard search use the `*` symbol.

The single character wildcard search looks for terms that match with the single character replaced. For example, to search for `text` or `test`:

```
te?t
```

Multiple character wildcard searches look for 0 or more characters. For example, to search for `test`, `tests`, or `tester`:

```
test*
```

You can also use wildcard searches in the middle of a term:

```
te*t
```

> **Note:** You cannot use a `*` or `?` symbol as the first character of a search.

<a name="lucene-regular-expression-searches"></a>
##### Regular Expression Searches

Lucene supports regular expression searches matching a pattern between forward slashes `/`. For example, to find documents containing `moat` or `boat`:

```
/[mb]oat/
```

The current supported syntax is documented in the `RegExp` class.

<a name="lucene-fuzzy-searches"></a>
##### Fuzzy Searches

Lucene supports fuzzy searches based on Damerau-Levenshtein Distance. To do a fuzzy search use the tilde `~` at the end of a single word term. For example, to search for a term similar in spelling to `roam`:

```
roam~
```

This search will find terms like `foam` and `roams`.

An optional parameter can specify the maximum number of edits allowed. The value is between 0 and 2. For example:

```
roam~1
```

The default is 2 edit distances if the parameter is not given.

> **Note:** Previously, a floating point value was allowed here. This syntax is deprecated.

<a name="lucene-proximity-searches"></a>
##### Proximity Searches

Lucene supports finding words within a specific distance of each other. To do a proximity search use the tilde `~` at the end of a phrase. For example, to search for `apache` and `jakarta` within 10 words of each other:

```
"jakarta apache"~10
```

<a name="lucene-range-searches"></a>
##### Range Searches

Range Queries allow one to match documents whose field values are between the lower and upper bound specified. Range Queries can be inclusive or exclusive of the upper and lower bounds. Sorting is done lexicographically.

```
mod_date:[20020101 TO 20030101]
```

This will find documents whose `mod_date` fields have values between 20020101 and 20030101, inclusive. Range queries are not reserved for date fields:

```
title:{Aida TO Carmen}
```

This will find all documents whose titles are between `Aida` and `Carmen`, but not including those values.

- **Inclusive** range queries use square brackets: `[A TO Z]`
- **Exclusive** range queries use curly brackets: `{A TO Z}`

<a name="lucene-boosting-a-term"></a>
##### Boosting a Term

To boost a term use the caret `^` with a boost factor (a number) at the end of the term. The higher the boost factor, the more relevant the term will be.

For example, to make `jakarta` more relevant than `apache`:

```
jakarta^4 apache
```

You can also boost phrase terms:

```
"jakarta apache"^4 "Apache Lucene"
```

By default, the boost factor is 1. The boost factor must be positive, but can be less than 1 (e.g. `0.2`).

---

<a name="lucene-boolean-operators"></a>
#### Boolean Operators

Boolean operators allow terms to be combined through logic operators. Lucene supports `AND`, `+`, `OR`, `NOT`, and `-` as Boolean operators.

> **Note:** Boolean operators must be ALL CAPS.

<a name="lucene-or"></a>
##### OR

The OR operator is the default conjunction operator. If there is no Boolean operator between two terms, OR is used. The OR operator finds a matching document if either of the terms exist. The symbol `||` can be used in place of `OR`.

To search for documents that contain either `"jakarta apache"` or just `jakarta`:

```
"jakarta apache" jakarta
```

or

```
"jakarta apache" OR jakarta
```

<a name="lucene-and"></a>
##### AND

The AND operator matches documents where both terms exist anywhere in the text. The symbol `&&` can be used in place of `AND`.

To search for documents that contain both `"jakarta apache"` and `"Apache Lucene"`:

```
"jakarta apache" AND "Apache Lucene"
```

<a name="lucene-required-"></a>
##### Required (`+`)

The `+` (required) operator requires that the term after it exists somewhere in the document.

To search for documents that must contain `jakarta` and may contain `lucene`:

```
+jakarta lucene
```

<a name="lucene-not"></a>
##### NOT

The NOT operator excludes documents that contain the term after it. The symbol `!` can be used in place of `NOT`.

To search for documents that contain `"jakarta apache"` but not `"Apache Lucene"`:

```
"jakarta apache" NOT "Apache Lucene"
```

> **Note:** The NOT operator cannot be used with just one term. The following search will return no results:
> ```
> NOT "jakarta apache"
> ```

<a name="lucene-prohibit--"></a>
##### Prohibit (`-`)

The `-` (prohibit) operator excludes documents that contain the term after it.

To search for documents that contain `"jakarta apache"` but not `"Apache Lucene"`:

```
"jakarta apache" -"Apache Lucene"
```

---

<a name="lucene-grouping"></a>
#### Grouping

Lucene supports using parentheses to group clauses to form sub-queries. This is useful for controlling the boolean logic for a query.

To search for either `jakarta` or `apache`, and require `website`:

```
(jakarta OR apache) AND website
```

---

<a name="lucene-field-grouping"></a>
#### Field Grouping

Lucene supports using parentheses to group multiple clauses to a single field.

To search for a title that contains both the word `return` and the phrase `"pink panther"`:

```
title:(+return +"pink panther")
```

---

<a name="lucene-escaping-special-characters"></a>
#### Escaping Special Characters

Lucene supports escaping special characters that are part of the query syntax. The current list of special characters is:

```
+ - && || ! ( ) { } [ ] ^ " ~ * ? : \ /
```

To escape these characters, use `\` before the character. For example, to search for `(1+1):2`:

```
\(1\+1\)\:2
```
