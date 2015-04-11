$LOAD_PATH.unshift File.expand_path(File.join File.dirname(__FILE__), '..', 'lib')

require 'pyramid-client'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :faraday
end

Pyramid.configure do |c|
  c.app_key    = '88480333'
  c.app_secret = '72fd96a2e4c9c2a9129f96a21bfb7012'
end

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
