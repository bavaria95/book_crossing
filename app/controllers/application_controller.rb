class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password,:city) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :city, :email, :password, :current_password, :is_female, :date_of_birth) }
        end
	def cities
		f = File.readlines("/public/cities.dat")
		@cities = []
		f.each { |e| cities<<e.strip  }    		
  	end
        
end