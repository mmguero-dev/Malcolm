#!/usr/bin/env bash

# The regular postgresql docker-entrypoint.sh runs
#   /docker-entrypoint-initdb.d/* whenever the container
#   starts up, but only if the database is empty.
# This wrapper entrypoint will also run /docker-entrypoint-startdb.d/*.sh
#   regardless of whether the database already exists. This
#   allows us to run certain migrations on every container start
#   to ensure things are the way we want them before continuing.

docker_process_start_files() {
    printf '\n'
    local f
    for f; do
        case "$f" in
            *.sh)
                if [ -x "$f" ]; then
                    printf '%s: running %s\n' "$(basename $0)" "$f"
                    "$f"
                else
                    printf '%s: sourcing %s\n' "$(basename $0)" "$f"
                    . "$f"
                fi
                ;;
        *)         printf '%s: ignoring %s\n' "$(basename $0)" "$f" ;;
        esac
        printf '\n'
    done
}

# If ${PGDATA} was initialized by an older PostgreSQL major version, upgrade
#   it in place before launching the server (no-op otherwise). This must
#   happen before the server starts: a major-version mismatch is a FATAL
#   startup error, and the pg_isready loop below would never succeed.
/usr/local/bin/pg-major-upgrade.sh || exit $?

# Launch the original entrypoint in the background and get its PID
$@ &
BACKGROUND_PID=$!

until pg_isready -h localhost -p ${PGPORT:-5432} -U "${POSTGRES_USER:-postgres}" >/dev/null 2>&1; do
  sleep 1
done
[[ -d /docker-entrypoint-startdb.d ]] && docker_process_start_files /docker-entrypoint-startdb.d/*

# Wait for the background process to complete and exit with its exit code
wait $BACKGROUND_PID
EXIT_CODE=$?
exit $EXIT_CODE
