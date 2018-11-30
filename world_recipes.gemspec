
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "world_recipes/version"

Gem::Specification.new do |spec|
  spec.name          = "world_recipes"
  spec.version       = WorldRecipes::VERSION
  spec.date          = '2018-11-28'
  spec.summary       = "Top World Cuisine Recipes"
  spec.description   = "Provides details on world cuisine recipes by category."
  spec.authors       = ["'Angelica Sanchez'"]
  spec.email         = ["'anlsanchez@ucdavis.edu'"]
  spec.files         = ["lib/world_recipes.rb", "lib/world_recipes/cli.rb","lib/world_recipes/cuisine.rb","lib/world_recipes/food_category.rb","lib/world_recipes/recipe.rb","lib/world_recipes/scraper.rb"]
  spec.homepage      = 'http://rubygems.org/gems/world-recipes'
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  #  spec.metadata["homepage_uri"] = spec.homepage
  #  spec.metadata["source_code_uri"] = "TODO:Put your gem's source code url here"
  #  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against " \
  #    "public gem pushes."
  #end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
#  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
#    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
#end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end
