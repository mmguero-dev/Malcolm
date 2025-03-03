#!/usr/bin/env bash

set -euo pipefail

# if postgres is disabled, exit successfully
[[ "${POSTGRES_DISABLED:-false}" == 'true' ]] && exit 0

# check if postgres is ready and responding
if [[ -n "${POSTGRES_NETBOX_DB:-}" ]] && [[ -n "${POSTGRES_NETBOX_USER:-}" ]]; then
    pg_isready -d "${POSTGRES_NETBOX_DB}" -U "${POSTGRES_NETBOX_USER}" >/dev/null 2>&1 || exit 1
else
    exit 0
fi
