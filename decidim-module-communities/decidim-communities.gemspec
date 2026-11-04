# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)
require "decidim/communities/version"

Gem::Specification.new do |s|
  s.name = "decidim-communities"
  s.version = Decidim::Communities::VERSION
  s.authors = ["Marius-Stelian Costea"]
  s.license = "AGPL-3.0-only"
  s.homepage = "https://digidemocracy.ro"
  s.summary = "Citizen-created communities for Decidim (digidemocracy.ro, milestone M2)."
  s.description = "Lets verified citizens create local, national or international communities that can later create digital institutions. Bottom-up governance layer for Decidim."
  s.required_ruby_version = "~> 3.4.0"
  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "README.md"]

  s.add_dependency "decidim-core", Decidim::Communities::DECIDIM_VERSION
  s.add_development_dependency "decidim-dev", Decidim::Communities::DECIDIM_VERSION
end
