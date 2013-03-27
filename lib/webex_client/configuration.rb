module WebexClient
  module Configuration
    
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def base_uri(uri=nil)
        return @base_uri if @base_uri
        @base_uri = Addressable::URI.parse(uri)
      end

      def meeting_password(password=nil)
        return @meeting_password if @meeting_password
        @meeting_password = password
      end

      def admin_password(password=nil)
        return @admin_password if @admin_password
        @admin_password = password
      end

      def admin_username(username=nil)
        return @admin_username if @admin_username
        @admin_username = username
      end

    end
  end
end
