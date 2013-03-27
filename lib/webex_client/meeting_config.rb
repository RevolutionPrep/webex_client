module WebexClient
  class MeetingConfig

    DEFAULT_FLAGS = {
      :chat => true,
      :polling => true,
      :video => true,
      :attendee_list => true,
      :file_share => true,
      :telephony => false,
      :document_sharing => true,
      :application_sharing => true,
      :desktop_sharing => false,
      :webtour => true,
      :meeting_recording => true,
      :annotation => true,
      :import_document => true,
      :save_document => false,
      :print_document => true,
      :switch_page => true,
      :view_thumbnails => true,
      :remote_control_application_sharing => true,
      :remote_control_desktop_sharing => true,
      :remote_control_web_tour =>  true
    }

    CUSTOMIZABLE_FLAGS = [
      :chat,
      :polling,
      :video,
      :attendee_list,
      :file_share,
      :document_sharing,
      :application_sharing,
      :webtour,
      :meeting_recording,
      :annotation,
      :import_document,
      :print_document,
      :switch_page,
      :view_thumbnails,
      :remote_control_application_sharing,
      :remote_control_desktop_sharing,
      :remote_control_web_tour
    ]

    FLAGS_IN_POSITION = [
      :chat, #0
      :polling,
      :video,
      :attendee_list,
      :file_share,
      :telephony, #5
      :document_sharing,
      :application_sharing,
      :desktop_sharing,
      :webtour,
      :meeting_recording, #10
      :annotation,
      :import_document,
      :save_document,
      :print_document,
      nil, #15
      :switch_page,
      nil, #17
      :view_thumbnails,
      nil, #19
      nil, #20
      :remote_control_application_sharing,
      :remote_control_desktop_sharing,
      :remote_control_web_tour
    ]

    PRESET_BROADCAST = [
      :chat,
      :polling,
      :webtour,
      :meeting_recording,
      :import_document,
      :print_document,
      :document_sharing,
      :switch_page,
      :view_thumbnails
    ]

    PRESET_INTERACTIVE = [
      :chat,
      :polling,
      :video,
      :attendee_list,
      :file_share,
      :document_sharing,
      :application_sharing,
      :webtour,
      :meeting_recording,
      :annotation,
      :import_document,
      :print_document,
      :view_thumbnails,
      :remote_control_application_sharing,
      :remote_control_desktop_sharing,
      :remote_control_web_tour
    ]

    FLAG_DESCRIPTIONS = {
      :chat => "Students and host are able to text chat.",
      :polling => "Conducting polls are available to the host and attendees",
      :video => "Host and attendees can view videos.",
      :attendee_list => "Attendees can view the list of other meeting attendees.",
      :file_share => "Host and attendees can transfer files from host's computer to an attendee's computer.",
      :document_sharing => "Host and attendees can view presentations and documents simultaneously.",
      :application_sharing => "Host and attendees can view the same running application simultaneously.",
      :webtour => "Host and attendees can view the same running web browser simultaneously.",
      :meeting_recording => "Host and attendees can record WebEx meetings.",
      :annotation => "Attendees can mark up the visible document or application.",
      :import_document => "Attendees can upload a document or file.",
      :print_document => "Attendees may print documents or files on screen.",
      :switch_page => "This allows attendees to go to the next page of a shared document on their own. If the host wants complete control of what the attendees see, turn this priviledge off.",
      :view_thumbnails => "Attendees can see thumbnails of documents on screen.",
      :remote_control_application_sharing => "Host or attendees can get control of a shared application to manipulate the application while sharing with other attendees.",
      :remote_control_desktop_sharing => "Host or attendees can get control of a shared desktop to manipulate the desktop while sharing with other attendees.",
      :remote_control_web_tour =>  "Host or attendees can get control of a shared browser to use the browser while sharing with other attendees."
    }

    def initialize(params={})
      set_options(params)
    end

    def set_options(params)
      @options = DEFAULT_FLAGS.dup
      params.keys.map.each do |key|
        @options[key.to_sym] = params[key]
      end
    end

    def to_param
      FLAGS_IN_POSITION.inject(String.new) do |param, flag|
        if flag.nil?
          param = "0" + param
        else
          param = (@options[flag.to_sym] ? "1" : "0") + param
        end
        param
      end.to_i(2).to_s
    end
  
  end
end
