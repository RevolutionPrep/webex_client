module WebexClient
  module URI
    class Profiles
      attr_reader :uri

      def initialize
        @uri = WebexClient.base_uri.dup
        @uri.path << '/p.php'
        @admin_username = WebexClient.admin_username
        @admin_password = WebexClient.admin_password
      end

      def login_uri(username, password, redirect_url)
        query = {
          'AT' => 'LI',
          'WID' => username,
          'PW' => password,
          'MU' => 'GoBack',
          'BU' => redirect_url
        }

        uri.query_values = query
        uri.to_s
      end

      def logout_uri(redirect_url)
        query = {
          'AT' => 'LO',
          'BU' => redirect_url
        }

        uri.query_values = query
        uri.to_s
      end

      def admin_login_no_redirect_uri
        query = {
          'AT' => 'LI',
          'WID' => @admin_username,
          'PW' => @admin_password
        }

        uri.query_values = query
        uri.to_s
      end

      def logout_no_redirect_uri
        query = {
          'AT' => 'LO'
        }

        uri.query_values = query
        uri.to_s
      end

      module ClassMethods
        def _uri_profiles
          @_uri_profiles ||= Profiles.new
        end

        def login_uri(*args)
          _uri_profiles.send :login_uri, *args
        end

        def admin_login_no_redirect_uri
          _uri_profiles.send :admin_login_no_redirect_uri
        end

        def logout_no_redirect_uri
          _uri_profiles.send :logout_no_redirect_uri
        end

        def logout_uri(*args)
          _uri_profiles.send :logout_uri, *args
        end
      end
    end
  end
end
