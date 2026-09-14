#!/usr/bin/env bash

# Packages a filtered snapshot of the Malcolm source tree into malcolm_src.zip,
# for handing off to an LLM as debugging/development context. Strips out
# anything that's noise for that purpose: generated assets and saved objects
# (Dashboards visualizations, index-pattern exports), binary/media files,
# deployment-target subtrees not relevant to core service development
# (malcolm-iso, hedgehog-raspi, kubernetes), and per-service data/config
# files that don't carry logic (Strelka scanner configs, Suricata rule
# packs, Logstash lookup maps). Keeps actual pipeline and service code,
# plus a small allowlist of scripts/ files that are broadly useful context
# even though the rest of that directory (the interactive installer, control
# wrapper symlinks) isn't. Also drops anything not tracked by git, so local
# scratch files and uncommitted work-in-progress never end up in the archive.
# Rebuilds the archive from scratch each run rather than updating an existing
# one, so stale entries from a prior run's exclude list can't linger silently
# in the zip.

set -euo pipefail

function file_list_cleanup() {
  local TF="${1}"
  [[ -n "$TF" ]] && [[ -f "$TF" ]] && rm -f "$TF" >/dev/null 2>&1
}

export SCRIPT_DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TMP_LIST=$(mktemp -t malcolm-files.XXXXXXXXXX)
TMP_TRACKED=$(mktemp -t malcolm-tracked.XXXXXXXXXX)
TMP_ZIP=$(mktemp -t malcolm-files.XXXXXXXXXX.zip)
trap "file_list_cleanup '${TMP_LIST}'; file_list_cleanup '${TMP_TRACKED}'; file_list_cleanup '${TMP_ZIP}'" SIGINT EXIT RETURN
pushd "$SCRIPT_DIR"/.. >/dev/null 2>&1

{
  fd -t f \
    -E '/_includes' \
    -E '/_layouts' \
    -E '/config' \
    -E '/docs' \
    -E '/hedgehog-raspi' \
    -E '/kubernetes' \
    -E '/malcolm-iso' \
    -E '/scripts' \
    -E '_config.yml' \
    -E 'arkime/etc' \
    -E 'arkime/parsers' \
    -E 'arkime/rules' \
    -E 'arkime/wise' \
    -E 'bootstrap.css' \
    -E 'bootstrap.min.js' \
    -E 'dashboards/dashboards' \
    -E 'dashboards/maps' \
    -E 'LICENSE.txt' \
    -E 'logstash.yml' \
    -E 'logstash/maps' \
    -E 'netbox/preload' \
    -E 'nginx/landingpage' \
    -E 'NOTICE.txt' \
    -E 'opensearch-config/config' \
    -E 'opensearch_dashboards.yml' \
    -E 'strelka/config' \
    -E 'suricata/rules-default' \
    -E '*.png' -E '*.svg' -E '*.ico' -E '.gitignore' \
    -E '*.ttf' -E '*.otf' -E '*.woff2' -E '*.md' \
    -E '*.pcap' -E '*.gz' -E '*.pack' -E '*.rev' -E '*.pb' \
    -E '*.xcf' -E '*.ai' -E '*.pdf' -E '*.odp' -E '*.odg' \
    -E '*.sample' \
    .

  fd -t f '^(malcolm_(common|constants|utils)\.py|safe-extract\.py)$' ./scripts
  fd -t f '^(README|components|contributing-(dashboards|logstash|new-log-fields|zeek))\.md$' ./docs
} | sed 's@^\./@@' | sort -u > "$TMP_LIST"

git ls-files > "$TMP_TRACKED"
grep -Fxf "$TMP_TRACKED" "$TMP_LIST" > "${TMP_LIST}.tracked" && mv "${TMP_LIST}.tracked" "$TMP_LIST"

rm -f "$TMP_ZIP"
zip -q "$TMP_ZIP" -@ < "$TMP_LIST"

popd >/dev/null 2>&1

mv -v "$TMP_ZIP" ./malcolm_src.zip
