class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :flash_to_headers

  before_filter :configure_permitted_parameters, if: :devise_controller?

  # This moves the flash hash to headers when using AJAX
  def flash_to_headers
    return unless request.xhr?
    response.headers['X-Message'] = flash_message
    response.headers["X-Message-Type"] = flash_type.to_s

    flash.discard # don't want the flash to appear when you reload page
  end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
    end
    	private

    	def flash_message
    	    flash.keys.each do |type|
    	        return flash[type] unless flash[type].blank?
    	    end
    	end

    	def flash_type
    	    flash.keys.each do |type|
    	        return type unless flash[type].blank?
    	    end
    	end
end
