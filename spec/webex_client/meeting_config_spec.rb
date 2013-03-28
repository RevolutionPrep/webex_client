require 'spec_helper'

module WebexClient
  describe MeetingConfig do
    
    context 'defaults' do
      subject { MeetingConfig.new }

      it 'returns flags' do
        subject.to_param.should eql("15032031")
      end
    end
    
    context 'options can be set' do
      subject { MeetingConfig.new(:chat => false) }
      
      it 'spits out correct params' do
        subject.to_param.should eql("111001010101111011011110".to_i(2).to_s)
      end
    end

  end
end
