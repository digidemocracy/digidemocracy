# Development image for the digidemocracy.ro Decidim app. UNTESTED.
FROM ruby:3.4.7-bookworm

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
      build-essential libpq-dev postgresql-client libicu-dev imagemagick libvips git curl \
  && curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
  && apt-get install -y nodejs \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
ENV BUNDLE_PATH=/bundle
EXPOSE 3000
CMD ["bash", "-lc", "bundle install && npm install && bin/rails db:prepare && bin/dev -b 0.0.0.0 || bin/rails server -b 0.0.0.0"]
