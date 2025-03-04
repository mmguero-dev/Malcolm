#!/usr/bin/env bash

set -euo pipefail

[[ "${NGINX_AUTH_MODE:-keycloak}" != 'keycloak' ]] && exit 0

# TODO
exit 0