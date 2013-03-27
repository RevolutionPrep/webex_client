require 'nokogiri'
require 'mechanize'
require 'addressable/uri'

require 'webex_client/version'
require 'webex_client/launch_config'
require 'webex_client/urls'
require 'webex_client/configuration'

module WebexClient
  include Configuration

  def self.configure
    yield self
  end
end
