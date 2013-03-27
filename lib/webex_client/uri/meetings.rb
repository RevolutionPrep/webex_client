module WebexClient
  module URI
    class Meetings
      attr_reader :uri, :meeting_pw

      def initialize
        @uri = WebexClient.base_uri.dup
        @uri.path << '/m.php'
        @meeting_pw = WebexClient.meeting_password
      end

      def schedule_meeting_uri(meeting_config, redirect_url, meeting_info={})
        query = {
          'AT' => 'SM',
          'PW' => meeting_pw,
          'IP' => '1',
          'NT' => '1',
          'MN' => meeting_info[:name],
          'DU' => meeting_info[:duration],
          'MN' => meeting_info[:description],
          'BU' => redirect_url,
          'MF' => meeting_config
        }

        uri.query_values = query
        uri.to_s
      end

      def join_meeting_uri(meeting_id, redirect_url)
        query = {
          'AT' => 'HM',
          'MK' => meeting_id,
          'BU' => redirect_url
        }

        uri.query_values = query
        uri.to_s
      end

      def student_join_meeting_uri(meeting_id, redirect_url, name, email)
        query = {
          'AT' => 'JM',
          'MK' => meeting_id,
          'PW' => meeting_pw,
          'BU' => redirect_url,
          'AN' => name,
          'AE' => email,
        }

        uri.query_values = query
        uri.to_s
      end

      def active_meetings_uri
        query = {
          'AT' => 'OM'
        }

        uri.query_values = query
        uri.to_s
      end

      module ClassMethods
        def _uri_meetings
          @_uri_meetings ||= Meetings.new
        end
        
        def schedule_meeting_uri(*args)
          _uri_meetings.send :schedule_meeting_uri, *args
        end

        def join_meeting_uri(*args)
          _uri_meetings.send :join_meeting_uri, *args
        end

        def student_join_meeting_uri(*args)
          _uri_meetings.send :student_join_meeting_uri, *args
        end

        def active_meetings_uri
          _uri_meetings.send :active_meetings_uri
        end
      end
    end
  end
end
