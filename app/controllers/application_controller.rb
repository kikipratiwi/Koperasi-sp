class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_official!

  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      added_attrs = [:name, :birthplace, :birthdate, :address, :phone_number, :username, :email, :password, :password_confirmation]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: [added_attrs, :current_password]
    end 

    def after_sign_in_path_for(resource)
      stored_location_for(resource) || root_path
    end 
end
