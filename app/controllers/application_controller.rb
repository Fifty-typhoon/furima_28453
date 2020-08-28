class ApplicationController < ActionController::Base
  #before_action :basic_auth
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :kana_first_name, :kana_last_name, :birthday])
  end

   def basic_auth
     authenticate_or_request_with_http_basic do |id, password|
       id == 'authorize' && password == '0987'
         id == ENV["BASIC_AUTH_ID"] && password == ENV["BASIC_AUTH_PASSWORD"]
     end
   end
end
