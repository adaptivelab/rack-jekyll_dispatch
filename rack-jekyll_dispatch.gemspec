# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/jekyll_dispatch/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-jekyll_dispatch"
  spec.version       = Rack::JekyllDispatch::VERSION
  spec.authors       = ["Adaptive Lab"]
  spec.email         = ["simonpreed@gmail.com"]
  spec.description   = "Rack middleware to serve Jekyll static content."
  spec.summary       = "Rack Middleware that allows Jekyll content to be served from a static directory within your Rack application. Derived from how Rails serves static content from ActionDispatch::Static."
  spec.homepage      = "https://github.com/adaptivelab/rack-jekyll_dispatch"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack"
end
