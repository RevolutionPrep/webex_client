require 'spec_helper'

module WebexClient
  describe Configuration do
    subject { WebexClient }

    describe '.base_uri' do
      before do
        subject.configure do |c|
          c.base_uri 'https://someurl.com'
        end
      end

      it 'returns a addressable uri' do
        subject.base_uri.should be_a(Addressable::URI)
      end

      it 'returns a url' do
        subject.base_uri.to_s.should eql('https://someurl.com')
      end
    end

    describe '.meeting_password' do
      before do
        subject.configure do |c|
          c.meeting_password '123456p'
        end
      end

      it 'returns a password' do
        subject.meeting_password.should eql('123456p')
      end
    end

    describe '.admin_password' do
      before do
        subject.configure do |c|
          c.admin_password '123456s'
        end
      end

      it 'returns a password' do
        subject.admin_password.should eql('123456s')
      end
    end

    describe '.admin_username' do
      before do
        subject.configure do |c|
          c.admin_username 'jim_jam'
        end
      end

      it 'returns a username' do
        subject.admin_username.should eql('jim_jam')
      end
    end

    describe '.meeting_type' do
      before do
        subject.configure do |c|
          c.meeting_type 'TC'
        end
      end

      it 'returns a meeting type' do
        subject.meeting_type.should eql('TC')
      end
    end
  end
end
