# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'HighriseCRM/client/version'

Gem::Specification.new do |spec|
  spec.name          = "HighriseCRM-client"
  spec.version       = HighriseCRM::Client::VERSION
  spec.authors       = ["vaberay"]
  spec.email         = ["ramon@wishpond.com"]
  spec.summary       = %q{To comunicate with the HighriseCRM API endpoints.}
  spec.description   = %q{The gem uses xml to format to comunicate, but then serves the content as json to the user.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"
  spec.add_dependency "gyoku"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "sinatra"
end
