class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #check_authorization :unless => :devise_controller?

	protect_from_forgery with: :exception
	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
     rescue_from CanCan::AccessDenied do |exception|
	 flash[:error] = "Brak uprawnień!"
	 redirect_to root_url
	end
  
	before_filter :configure_permitted_parameters, if: :devise_controller?
	
	def not_found
	  flash[:error] = "Strona, której szukasz nie istnieje."
	    redirect_to root_url
	end

  private
	  def record_not_found
	  	flash[:error] = "Strona, której szukasz nie istnieje."
	    redirect_to root_url
	  end

	protected
			def configure_permitted_parameters
	  	devise_parameter_sanitizer.for(:sign_up) << :name
	  	devise_parameter_sanitizer.for(:account_update) << :name
		end
	 




end
