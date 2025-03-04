#!/usr/bin/env bash

if [[ "${NGINX_AUTH_MODE:-keycloak}" == "keycloak" ]]; then
  POSTGRES_HOST=${POSTGRES_HOST:-postgres}
  PGPORT=${PGPORT:-5432}
  POSTGRES_KEYCLOAK_DB=${POSTGRES_KEYCLOAK_DB:-keycloak}
  export KC_DB_USERNAME="${POSTGRES_KEYCLOAK_USER:-keycloak}"
  export KC_DB_PASSWORD="${POSTGRES_KEYCLOAK_PASSWORD:-}"
  export KC_DB_URL="jdbc:postgresql://${POSTGRES_HOST}:${PGPORT}/${POSTGRES_KEYCLOAK_DB}"
  export KC_DB=postgres
  until PGPASSWORD="${KC_DB_PASSWORD}" pg_isready -h "${POSTGRES_HOST}" -p ${PGPORT} -U "${KC_DB_USERNAME}" >/dev/null 2>&1; do
    sleep 5
  done
  echo "PostgreSQL is up and ready at ${KC_DB_URL}"
  # todo: remove and put in a proper check for the user/db
  sleep 20
fi

exec "$@"
