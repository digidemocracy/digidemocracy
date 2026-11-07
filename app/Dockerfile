# Development image for the digidemocracy.ro Decidim app. DEV ONLY. UNTESTED end-to-end.
# ruby:3.4.7-bookworm is a multi-arch official image (amd64 + arm64), so Apple Silicon
# Macs run it natively - no `platform: linux/amd64` emulation needed.
FROM ruby:3.4.7-bookworm

# Decidim 0.32 requires Node >= 22.14 (see decidim/.node-version).
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
      build-essential libpq-dev postgresql-client libicu-dev imagemagick libvips42 \
      git curl ca-certificates \
  && curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
  && apt-get install -y --no-install-recommends nodejs \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
ENV BUNDLE_PATH=/bundle \
    BUNDLE_JOBS=4 \
    GEM_HOME=/bundle \
    PATH=/bundle/bin:$PATH

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 3000
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]
