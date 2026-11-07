#!/usr/bin/env bash
# Dev entrypoint: wait for Postgres, install deps, prepare DB, then run the command.
set -euo pipefail

# During ./setup.sh the app does not exist yet; just run the given command.
if [ ! -f /app/Gemfile ] || [ "${SKIP_APP_PREPARE:-0}" = "1" ]; then
  exec "$@"
fi

echo "Waiting for PostgreSQL at ${DATABASE_HOST:-db}..."
for i in $(seq 1 60); do
  pg_isready -h "${DATABASE_HOST:-db}" -U "${DATABASE_USERNAME:-decidim}" -q && break
  sleep 2
done

bundle check >/dev/null 2>&1 || bundle install
[ -d node_modules ] && [ -n "$(ls -A node_modules 2>/dev/null)" ] || npm install
rm -f tmp/pids/server.pid

if [ "${RUN_DB_PREPARE:-1}" = "1" ]; then
  bin/rails db:prepare
fi

exec "$@"
