class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate
  
  protected
  
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user = User.find_by_username user_name
      if user && user.authenticate(password)
        session[:user] = user_name
      else
        flash.now.alert = "Ungültige Zugangsdaten"
      end
    end

  end
  
  
end
