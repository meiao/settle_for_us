class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_login

  helper_method :current_user
  
  def check_login
    redirect_to(:controller => 'main') if session[:current_user] == nil
  end
  

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = session[:current_user]
    @current_user
  end
end
