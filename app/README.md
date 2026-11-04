# Decidim application (development)

> ⚠️ **Untested.** These files were written but not yet run (no Docker/Ruby available where they were prepared). Expect to adjust them on first run.

The Decidim application is **generated**, not committed by hand, using the official generator for Decidim **0.32.2** (Ruby 3.4.7, Rails 8.1, Node 22, PostgreSQL, Redis).

## Steps

```bash
./setup.sh                                   # one-time: generates ./digidemocracy_app
docker compose run --rm web bash -lc "bundle install && \
  bin/rails decidim_initiatives:install:migrations decidim_elections:install:migrations && \
  bin/rails db:prepare"
docker compose up                            # http://localhost:3000
docker compose exec web bin/rails db:seed    # optional demo data
```

Exact rake task names for module migrations may differ; check each module's README in the Decidim repo for v0.32.

## Romanian locale

`docker-compose.yml` sets `DECIDIM_DEFAULT_LOCALE=ro` and `DECIDIM_AVAILABLE_LOCALES=ro,en`. Verify that `config/initializers/decidim.rb` in the generated app reads these variables; otherwise set `config.default_locale = :ro` and `config.available_locales = [:ro, :en]` there. Decidim ships Romanian translations via Crowdin; completeness should be checked.

## Without Docker

Install Ruby 3.4.7, Node 22, PostgreSQL and Redis, then `gem install decidim -v 0.32.2 && decidim digidemocracy_app`. See https://docs.decidim.org/en/develop/install/manual.
