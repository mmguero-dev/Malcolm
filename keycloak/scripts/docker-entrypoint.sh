#!/usr/bin/env bash

if [[ "${KEYCLOAK_DISABLED:-false}" != "true" ]]; then
  export KC_BOOTSTRAP_ADMIN_USERNAME="${MALCOLM_USERNAME:-}"
  # TODO this is wrong, this is the hashed password, this is a placeholder only for now
  export KC_BOOTSTRAP_ADMIN_PASSWORD="${MALCOLM_PASSWORD:-}"

  export KC_DB=postgres
  export KC_DB_USERNAME="${POSTGRES_KEYCLOAK_USER:-keycloak}"
  export KC_DB_PASSWORD="${POSTGRES_KEYCLOAK_PASSWORD:-}"
  export KC_DB_URL="jdbc:postgresql://${POSTGRES_HOST:-postgres}:${PGPORT:-}/${POSTGRES_KEYCLOAK_DB:-keycloak}"
fi

exec "$@"
