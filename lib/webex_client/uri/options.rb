module WebexClient
  module URI
    class Options
      attr_reader :uri

      def initialize
        @uri = WebexClient.base_uri.dup
        @uri.path << '/o.php'
      end

      def set_meeting_type_uri(type, redirect_url)
        query = [
          ['AT', 'ST'],
          ['SP', type],
          ['BU', redirect_url]
        ]

        uri.query_values = query
        uri.to_s
      end

      module ClassMethods
        def _uri_options
          @_uri_options ||= Options.new
        end

        def set_meeting_type_uri(*args)
          _uri_options.send :set_meeting_type_uri, *args
        end
      end
    end
  end
end
