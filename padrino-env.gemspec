# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'padrino/env/version'

Gem::Specification.new do |spec|
  spec.name          = "padrino-env"
  spec.version       = Padrino::Env::VERSION
  spec.authors       = ["Thomas Brewer"]
  spec.email         = ["tom@leftplusright.com"]
  spec.description   = %q{Loads ENV variables from a yml file}
  spec.summary       = %q{Loads ENV variables from a yml file}
  spec.homepage      = "http://leftplusright.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
