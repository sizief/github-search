$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'minitest/autorun'
require 'test/unit'
require 'rack/test'
require 'vcr'

require_relative '../lib/access'
require_relative '../lib/logging'
require_relative '../app.rb'

VCR.configure do |config|
  config.cassette_library_dir = 'fixtures/vcr_cassettes'
  config.hook_into :webmock
  ignore_localhost = true
end
