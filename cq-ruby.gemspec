# require_relative 'lib/cq'
# coding: utf-8
# lib = File.expand_path('../lib', __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
$:.push File.expand_path("../lib", __FILE__)
require './lib/cq/version'

Gem::Specification.new do |spec|
  spec.name          = "cq-ruby"
  spec.version       = CQ::VERSION
  spec.authors       = ["Yared Tseghu"]
  spec.email         = ["yared.tseghu@gmail.com"]
  spec.summary       = %q{ Client to get json format from CQ5 and later version }
  spec.description   = %q{ Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files = Dir["README.md","Gemfile","Rakefile", "spec/*", "lib/**/*"]
  # spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "railties"
  spec.add_runtime_dependency "activesupport"
  spec.add_development_dependency "rspec"
end
