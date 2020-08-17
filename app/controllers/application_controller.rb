class ApplicationController < ActionController::Base
  before_action :basic_auth


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |id, password|
      id == 'authorize' && password == '0987'
        id == ENV["BASIC_AUTH_ID"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
