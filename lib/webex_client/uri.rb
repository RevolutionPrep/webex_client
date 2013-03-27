require 'webex_client/uri/meetings'
require 'webex_client/uri/options'
require 'webex_client/uri/profiles'

module WebexClient
  module URI
    def self.included(base)
      base.extend(Meetings::ClassMethods)
      base.extend(Options::ClassMethods)
      base.extend(Profiles::ClassMethods)
    end
  end
end
