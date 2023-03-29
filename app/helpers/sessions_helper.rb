module SessionsHelper

  def build_error_message(messages)
    # Build error message
    error_message = "<p>Failed to create new user. There are some errors:</p><ul>"
    messages.each do |message|
      error_message << "<li>#{message}</li>"
    end
    error_message << "</ul>"
    error_message
  end
end
