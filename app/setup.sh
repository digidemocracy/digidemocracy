#!/usr/bin/env bash
# Generates the Decidim application into ./digidemocracy_app using the official generator.
# UNTESTED end-to-end. Requires Docker.
set -euo pipefail
cd "$(dirname "$0")"
DECIDIM_VERSION="${DECIDIM_VERSION:-0.32.2}"
APP=digidemocracy_app

if [ -d "$APP" ]; then echo "$APP already exists, skipping generation."; exit 0; fi

docker compose build web
docker compose run --rm --no-deps -v "$PWD:/work" -w /work web bash -lc "
  gem install decidim -v $DECIDIM_VERSION &&
  decidim $APP &&
  cd $APP &&
  printf '\n# Modules\ngem \"decidim-initiatives\", \"$DECIDIM_VERSION\"\ngem \"decidim-elections\", \"$DECIDIM_VERSION\"\n# gem \"decidim-communities\", path: \"/modules/decidim-module-communities\"\n' >> Gemfile
"
cat <<MSG
Generated $APP with Decidim $DECIDIM_VERSION.
Next:
  1. Install extra modules' migrations (see app/README.md).
  2. docker compose up
  3. docker compose exec web bin/rails db:seed   # optional demo data
Romanian is set as default locale via DECIDIM_DEFAULT_LOCALE=ro in docker-compose.yml;
check config/initializers/decidim.rb in the generated app.
MSG
