#!/usr/bin/env bash
# Generates the Decidim application into ./digidemocracy_app using the official generator.
# DEV ONLY. UNTESTED end-to-end. Requires Docker Desktop (macOS) or Docker Engine + compose plugin (Linux).
# First run can take 20-40+ minutes: it builds the image and compiles native gems.
set -euo pipefail
cd "$(dirname "$0")"
DECIDIM_VERSION="${DECIDIM_VERSION:-0.32.2}"   # latest 0.32.x on rubygems.org as of Nov 2026
APP=digidemocracy_app

command -v docker >/dev/null || { echo "Docker not found. Install Docker Desktop: https://www.docker.com/products/docker-desktop/"; exit 1; }
docker info >/dev/null 2>&1 || { echo "Docker is installed but not running. Start Docker Desktop and retry."; exit 1; }
docker compose version >/dev/null 2>&1 || { echo "'docker compose' (v2) not available. Update Docker."; exit 1; }

if [ -d "$APP" ]; then echo "$APP already exists, skipping generation. Delete it to regenerate."; exit 0; fi

echo ">> Building dev image (native arch: $(uname -m))..."
docker compose build web

echo ">> Generating Decidim $DECIDIM_VERSION app (slow on first run)..."
docker compose run --rm --no-deps -e SKIP_APP_PREPARE=1 -v "$PWD:/work" -w /work web bash -lc "
  set -e
  gem install decidim -v $DECIDIM_VERSION --no-document
  decidim _${DECIDIM_VERSION}_ $APP
  cd $APP
  cat >> Gemfile <<GEMS

# digidemocracy modules (official Decidim gems, same version as core)
gem \"decidim-initiatives\", \"$DECIDIM_VERSION\"
gem \"decidim-elections\", \"$DECIDIM_VERSION\"
# Not ready yet - enable once the module has code:
# gem \"decidim-communities\", path: \"/modules/decidim-module-communities\"
GEMS
"

# Fallback: Decidim 0.32 reads DECIDIM_DEFAULT_LOCALE / DECIDIM_AVAILABLE_LOCALES (set in
# docker-compose.yml). Only if the generated initializer hardcodes locales, patch them.
INIT="$APP/config/initializers/decidim.rb"
if [ -f "$INIT" ]; then
  sed -i.bak -E \
    -e 's/^([[:space:]]*)config\.default_locale = .*/\1config.default_locale = :ro/' \
    -e 's/^([[:space:]]*)config\.available_locales = .*/\1config.available_locales = [:ro, :en]/' \
    "$INIT" && rm -f "$INIT.bak"
fi

echo ">> Installing gems, module migrations and preparing the database..."
docker compose run --rm -e RUN_DB_PREPARE=0 web bash -lc "
  set -e
  bundle install
  bin/rails decidim:upgrade
  bin/rails db:prepare
"

cat <<MSG

Done: generated $APP with Decidim $DECIDIM_VERSION (+ initiatives, elections).
Next:
  docker compose up                              # then open http://localhost:3000
  docker compose exec web bin/rails db:seed      # optional demo data
  docker compose exec web bin/rails decidim_system:create_admin   # system admin at /system
MSG
