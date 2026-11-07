# Decidim application (local development)

> ⚠️ **Untested end-to-end.** These files were prepared on a machine without Docker, so they have never actually been run. Expect to fix small things on the first run.

The Decidim app is **generated** by the official generator, not committed (it is git-ignored). Stack: Decidim **0.32.2** (latest 0.32.x on rubygems.org), Ruby 3.4.7, Node ≥ 22.14, PostgreSQL 16, Redis 7.

## Requirements

- Docker Desktop (macOS) or Docker Engine + compose plugin (Linux).
- **At least 8 GB RAM allocated to Docker** (Docker Desktop → Settings → Resources), plus ~10 GB free disk.
- Apple Silicon (M1–M4) and Intel Macs are both supported natively: `ruby:3.4.7-bookworm`, `postgres:16` and `redis:7` are multi-arch images, so no `linux/amd64` emulation is used.

## macOS steps

1. Install Docker Desktop from https://www.docker.com/products/docker-desktop/ (pick Apple chip or Intel chip), open it and wait until it says it is running.
2. In Terminal:
   ```bash
   git clone https://github.com/digidemocracy/digidemocracy.git
   cd digidemocracy/app
   ./setup.sh
   ```
   The first run can take **20–40+ minutes**: it builds the image, installs Decidim and compiles native gems. Later runs are fast (gems are cached in a Docker volume).
3. Start the platform:
   ```bash
   docker compose up
   ```
4. Open http://localhost:3000. The first page load can be slow while assets compile.
5. Optional:
   ```bash
   docker compose exec web bin/rails db:seed                     # demo data
   docker compose exec web bin/rails decidim_system:create_admin # then log in at /system
   ```

Linux is the same from step 2.

## What setup.sh does

1. Checks Docker is installed and running.
2. Builds the dev image and runs `decidim digidemocracy_app` (official generator, pinned version).
3. Appends `decidim-initiatives` and `decidim-elections` (both published for 0.32.2) to the Gemfile; the communities module stays commented out.
4. Fallback locale patch in `config/initializers/decidim.rb` (only if it hardcodes locales).
5. `bundle install`, `bin/rails decidim:upgrade` (installs module migrations, as the modules' READMEs instruct) and `bin/rails db:prepare`.

Override the version with `DECIDIM_VERSION=0.32.x ./setup.sh`. Delete `digidemocracy_app/` to regenerate.

## Configuration (dev-only defaults)

`docker-compose.yml` sets Decidim's official env vars `DECIDIM_DEFAULT_LOCALE=ro`, `DECIDIM_AVAILABLE_LOCALES=ro,en`, `DECIDIM_FORCE_SSL=false`, plus a placeholder `SECRET_KEY_BASE` and `decidim/decidim` DB credentials. **These are for local development only**; generate real secrets (`bin/rails secret`) for any server.

db and redis have healthchecks; `web` waits for them to be healthy, and its entrypoint also waits for Postgres, installs missing gems/npm packages and runs `db:prepare`.

## Background jobs

In development Decidim works with Rails' default in-process ActiveJob adapter, so no worker runs by default. Production should use a real queue; the official generator supports `--queue sidekiq`. A `worker` service is included behind a compose profile (`docker compose --profile worker up`) and only makes sense if the app has Sidekiq in its Gemfile.

## Troubleshooting

- **Killed / exit code 137** during build or bundle: give Docker more RAM.
- **Port 3000 in use**: change `"3000:3000"` to `"3001:3000"` in `docker-compose.yml`.
- **Stuck gems**: `docker compose down -v` (deletes DB and gem cache) and run `./setup.sh` again after deleting `digidemocracy_app/`.
- **Organization**: after creating a system admin, create an organization at `/system` with host `localhost` and Romanian as the default locale.

## Without Docker

Install Ruby 3.4.7, Node 22, PostgreSQL and Redis, then `gem install decidim -v 0.32.2 && decidim digidemocracy_app`. See https://docs.decidim.org/en/develop/install/manual.
