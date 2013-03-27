module WebexClient
  module URI
    class Options
      attr_reader :uri

      def initialize
        @uri = WebexClient.base_uri.dup
        @uri.path << 'o.php'
      end

      def set_meeting_type_uri(type, redirect_url)
        query = {
          'AT' => 'ST',
          'SP' => type,
          'BU' => redirect_url
        }

        uri.query_values = query
        uri.to_s
      end

      module ClassMethods
        def _options_uri
          @_options_uri ||= Options.new
        end
      end
    end
  end
end
