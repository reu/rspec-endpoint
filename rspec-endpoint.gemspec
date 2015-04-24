# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/endpoint/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-endpoint"
  spec.version       = RSpec::Endpoint::VERSION
  spec.authors       = ["Rodrigo Navarro"]
  spec.email         = ["rnavarro@rnavarro.com.br"]

  spec.summary       = "Simple syntax additions to ease API request tests with RSpec"
  spec.description   = %q{RSpec::Endpoint provides the `endpoint` method as a helper to test HTTP requests. It parses and replaces the description with the informed params.}
  spec.homepage      = "https://github.com/reu/rspec-endpoint"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rspec-core", ">= 3.0.0"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
