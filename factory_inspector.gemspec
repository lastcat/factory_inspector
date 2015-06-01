# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'factory_inspector/version'

Gem::Specification.new do |spec|
  spec.name          = "factory_inspector"
  spec.version       = FactoryInspector::VERSION
  spec.authors       = ["yoshitake.nakaji"]
  spec.email         = ["kokodoko966@gmail.com"]

  spec.summary       = "see <blog url>"
  spec.description   = "see <blog url>"
  spec.homepage      = "https://github.com/lastcat/factory_inspector.git"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "pry-byebug"
end
