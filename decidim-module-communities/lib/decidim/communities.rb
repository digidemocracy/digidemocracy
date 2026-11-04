# frozen_string_literal: true

require "decidim/communities/version"
require "decidim/communities/engine"

module Decidim
  # Citizen-created communities (M2). See README.md for scope.
  module Communities
    # Allowed scope levels for a community.
    LEVELS = %w(local national international).freeze
  end
end
