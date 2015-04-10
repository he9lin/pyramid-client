$LOAD_PATH.unshift File.expand_path(File.join File.dirname(__FILE__), '..', 'lib')

require 'pyramid-client'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :faraday
end

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
