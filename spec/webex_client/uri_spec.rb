require 'spec_helper'
require 'cgi'

module WebexClient
  describe URI do
    subject { WebexClient }
    let(:return_url) { CGI.escape("http://whatever.com") }

    before do
      subject.configure do |c|
        c.base_uri WEBEX_CONFIG['BASE_URL']
        c.meeting_password WEBEX_CONFIG['MEETING_PASSWORD']
        c.admin_password WEBEX_CONFIG['ADMIN_PASSWORD']
        c.admin_username WEBEX_CONFIG['ADMIN_USERNAME']
      end
    end

    context 'profiles' do
      describe '.login_url' do
        it 'returns a url with correct params' do
          expected = "#{subject.base_uri}/p.php?AT=LI&BU=" + return_url + "&MU=GoBack&PW=important&WID=jimmy"
          subject.login_uri('jimmy', 'important', 'http://whatever.com').should eql(expected) 
        end
      end

      describe '.logout_uri' do
        it 'returns a url with with the correct params' do
          expected = "#{subject.base_uri}/p.php?AT=LO&BU=" + return_url
          subject.logout_uri('http://whatever.com').should eql(expected)
        end
      end

      describe '.admin_login_no_redirect_uri' do
        it 'returns a url with with the correct params' do
          expected = "#{subject.base_uri}/p.php?AT=LI&PW=#{subject.admin_password}&WID=#{subject.admin_username}"
          subject.admin_login_no_redirect_uri.should eql(expected)
        end
      end

      describe '.logout_no_redirect_uri' do
        it 'returns a url with with the correct params' do
          expected = "#{subject.base_uri}/p.php?AT=LO"
          subject.logout_no_redirect_uri.should eql(expected)
        end
      end
    end

    context 'meetings' do
      describe '.schedule_meetings'
      describe '.active_meetings_uri' do
        it 'returns a url with with the correct params' do
          expected = "#{subject.base_uri}/m.php?AT=OM"
          subject.active_meetings_uri.should eql(expected)
        end
      end
    end

  end
end
