require 'spec_helper'
require 'cgi'

module WebexClient
  describe URI do
    subject { WebexClient }
    let(:return_url) { "http://whatever.com" }
    let(:return_url_escaped) { CGI.escape(return_url) }

    before do
      subject.configure do |c|
        c.base_uri WEBEX_CONFIG['BASE_URL']
        c.meeting_password WEBEX_CONFIG['MEETING_PASSWORD']
        c.meeting_type WEBEX_CONFIG['MEETING_TYPE']
        c.admin_password WEBEX_CONFIG['ADMIN_PASSWORD']
        c.admin_username WEBEX_CONFIG['ADMIN_USERNAME']
      end
    end

    context 'profiles' do
      describe '.login_url' do
        it 'returns a url with correct params' do
          expected = "#{subject.base_uri}/p.php?AT=LI&WID=jimmy&PW=important&MU=GoBack&BU=#{return_url_escaped}"
          subject.login_uri('jimmy', 'important', return_url).should eql(expected) 
        end
      end

      describe '.logout_uri' do
        it 'returns a url with with the correct params' do
          expected = "#{subject.base_uri}/p.php?AT=LO&BU=#{return_url_escaped}"
          subject.logout_uri(return_url).should eql(expected)
        end
      end

      describe '.admin_login_no_redirect_uri' do
        it 'returns a url with with the correct params' do
          expected = "#{subject.base_uri}/p.php?AT=LI&WID=#{subject.admin_username}&PW=#{subject.admin_password}"
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
      describe '.schedule_meeting_uri' do
        it 'returns a url with the correct params' do
          args = {
            :duration => '20',
            :description => 'Awesome'
          }
          expected = "#{subject.base_uri}/m.php?AT=SM&PW=#{subject.meeting_password}&IP=1&NT=1&MN=Awesome&DU=20&BU=#{return_url_escaped}&MF=apple"

          subject.schedule_meeting_uri('apple', return_url, args).should eql(expected)
        end
      end

      describe '.join_meeting_uri' do
        it 'returns a url with with the correct params' do
          expected = "#{subject.base_uri}/m.php?AT=HM&MK=1234567&BU=#{return_url_escaped}"
          subject.join_meeting_uri('1234567', return_url).should eql(expected)
        end
      end

      describe '.student_join_meeting_uri' do
        it 'returns a url with with the correct params' do
          expected = "#{subject.base_uri}/m.php?AT=JM&MK=1234567&PW=#{subject.meeting_password}&BU=#{return_url_escaped}&AN=asasas&AE=#{CGI.escape('a@me.com')}"
          subject.student_join_meeting_uri('1234567', return_url, 'asasas', 'a@me.com').should eql(expected)
        end
      end

      describe '.active_meetings_uri' do
        it 'returns a url with with the correct params' do
          expected = "#{subject.base_uri}/m.php?AT=OM&servicename=#{subject.meeting_type}"
          subject.active_meetings_uri.should eql(expected)
        end
      end
    end

    context 'options' do
      describe '.set_meeting_type_uri' do
        it 'returns a url with with the correct params' do
          expected = "#{subject.base_uri}/o.php?AT=ST&SP=TC&BU=#{return_url_escaped}"
          subject.set_meeting_type_uri(return_url).should eql(expected)
        end
      end
    end

  end
end
