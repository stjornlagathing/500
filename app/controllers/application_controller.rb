class ApplicationController < ActionController::Base
  helper :all 
  protect_from_forgery

  filter_parameter_logging :password
  
  
  
  
  
  protected
  
  def logged_in?
    current_user != nil
  end
  helper_method :logged_in?
  
  def current_user
    #session[:user_id] = User.first.id unless RAILS_ENV == 'production'
    @current_user ||= User.find(session[:user_id])  if session[:user_id]
  end
  helper_method :current_user
  
  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end

  
end
