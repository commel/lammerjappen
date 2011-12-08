class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authenticate
  
  helper_method :current_user
  
  protected
  
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user = User.find_by_username user_name
      if user && user.authenticate(password)
        session[:user] = user_name
      end
    end
  end
  
  def current_user
    User.find_by_username session[:user] if session[:user]
  end
  
  
end
