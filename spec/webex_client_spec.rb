require 'spec_helper'

describe WebexClient do
  before do
    subject.configure do |c|
      c.base_uri WEBEX_CONFIG['BASE_URL']
      c.meeting_password WEBEX_CONFIG['MEETING_PASSWORD']
      c.admin_password WEBEX_CONFIG['ADMIN_PASSWORD']
      c.admin_username WEBEX_CONFIG['ADMIN_USERNAME']
    end
  end

  describe '#active_keys' do
    it 'returns a list of active webex meetings keys in xml' do
      VCR.use_cassette('active_meetings_keys') do
        meeting_keys = subject.active_keys
        meeting_keys.should be_a(Array)
        meeting_keys.join(',').should match(/\d{9,20},?/)
      end
    end
  end

  describe '#retrieve_active_keys_xml' do
    it 'returns a list of active webex meetings keys in xml' do
      VCR.use_cassette('active_meetings_keys') do
        xml = subject.retrieve_active_keys_xml
        meeting_keys = Nokogiri.XML(xml).at('MeetingKeys').text
        meeting_keys.should match(/\d{9,20};/)
      end
    end
  end
end
