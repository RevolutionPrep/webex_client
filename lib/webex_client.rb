require 'nokogiri'
require 'mechanize'
require 'addressable/uri'

require 'webex_client/version'
require 'webex_client/configuration'
require 'webex_client/launch_config'
require 'webex_client/uri'

module WebexClient
  include Configuration
  include URI

  def self.configure
    yield self
  end

  def self.active_keys
    Nokogiri.XML(retrieve_active_key_xml).search('ListOpenMeetings/MeetingKeys').text.split(';')
  end

  def self.retrieve_active_keys_xml
    agent = Mechanize.new
    agent.max_history = 5
    agent.get(admin_login_no_redirect_uri)
    page = agent.get(active_meetings_uri)
    agent.get(logout_no_redirect_uri)
    page.body
  end
end
