# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pyramid/version'

Gem::Specification.new do |spec|
  spec.name          = "pyramid-client"
  spec.version       = Pyramid::VERSION
  spec.authors       = ["Lin He"]
  spec.email         = ["he9lin@gmail.com"]
  spec.summary       = %q{A client to access pyramid lib API.}
  spec.description   = %q{A client to access pyramid lib API.}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.date          = Time.now.strftime('%Y-%m-%d')

  spec.files             = Dir['README*', 'LICENSE*', 'CHANGELOG*']
  spec.files            += Dir['{lib}/**/*']
  spec.test_files        = Dir['{spec}/**/*']
  spec.extra_rdoc_files  = Dir['README*', 'LICENSE*', 'CHANGELOG*']
  spec.extra_rdoc_files += Dir['{doc}/**/*.{txt,md}']
  spec.require_paths     = ['lib']

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency "faraday", "~> 0.8.8"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "ey-hmac", "~> 2.0.0"
  spec.add_dependency "hashie", "= 3.3.1"
  spec.add_dependency "activesupport", "~> 4.1.6"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2.0"
  spec.add_development_dependency "vcr", "~> 2.9.3"
end
