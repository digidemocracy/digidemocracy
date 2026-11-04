# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module Communities
    # Rails engine for the communities module. Routes, models and
    # permissions will be added during M2.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Communities
    end
  end
end
