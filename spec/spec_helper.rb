# encoding: utf-8
require 'bundler/setup'
require 'webex_client'
require 'vcr'

WEBEX_CONFIG = YAML.load(File.open(File.expand_path '../webex_config.yml', __FILE__).read)

VCR.configure do |c|
  c.filter_sensitive_data("<PW>") { WEBEX_CONFIG['ADMIN_PASSWORD'] }
  c.filter_sensitive_data("<WID>") { WEBEX_CONFIG['ADMIN_USERNAME'] }
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :fakeweb
end

RSpec.configure do |c|
  c.mock_with :mocha

  c.before(:each) do
    WebexClient.instance_variable_set :@base_uri, nil
    WebexClient.instance_variable_set :@meeting_password, nil
    WebexClient.instance_variable_set :@admin_password, nil
    WebexClient.instance_variable_set :@admin_username, nil
  end
end
