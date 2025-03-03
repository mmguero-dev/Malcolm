#!/usr/bin/env bash

if [[ "${KEYCLOAK_DISABLED:-false}" != "true" ]]; then
  /usr/local/bin/jdk-cacerts-auto-import.sh

  export KC_DB=postgres
  export KC_DB_USERNAME="${POSTGRES_KEYCLOAK_USER:-keycloak}"
  export KC_DB_PASSWORD="${POSTGRES_KEYCLOAK_PASSWORD:-}"
  export KC_DB_URL="jdbc:postgresql://${POSTGRES_HOST:-postgres}:${PGPORT:-}/${POSTGRES_KEYCLOAK_DB:-keycloak}"
fi

exec "$@"
