# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "controlled_access/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "controlled_access"
  spec.version     = ControlledAccess::VERSION::STRING
  spec.authors     = ["Irfan Ahmed"]
  spec.email       = ["irfandhk@gmail.com"]
  spec.homepage    = "https://github.com/rubyrider/controlled_access"
  spec.summary     = "Provides plain old ruby class to control access database based role system"
  spec.description = "Complex platforms require dynamic role bases system where permission set is composed based on dynamic permission sets"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "pundit", "2.0.1"
  spec.add_dependency "rails", "~> 5.2.3"

  spec.add_development_dependency "mysql2"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rails"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "fuubar"
  spec.add_development_dependency "annotate_models"
end
