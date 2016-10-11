module ApplicationHelper

	def header(text)
	  content_for(:header) { text.to_s }
	end

	def custom_bootstrap_flash
	  flash_messages = []
	  flash.each do |type, message|
	    type = 'success' if type == 'notice'
	    type = 'error'   if type == 'alert'
	    text = "<script>toastr.#{type}('#{message}');</script>"
	    flash_messages << text.html_safe if message
	  end
	  flash_messages.join("\n").html_safe
	end


	def flash_class(level)
	  case level.to_sym
	    when :notice then "alert alert-success"
	    when :info then "alert alert-info"
	    when :alert then "alert alert-danger"
	    when :warning then "alert alert-warning"
	  end
  end

  def active_page(active_page)
    @active == active_page ? "active" : ""
  end
end