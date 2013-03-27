# encoding: utf-8
require 'bundler/setup'
require 'webex_client'
require 'vcr'

WEBEX_CONFIG = YAML.load(File.open(File.expand_path '../webex_config.yml', __FILE__).read)

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :fakeweb
end

RSpec.configure do |c|
  c.mock_with :mocha
end
