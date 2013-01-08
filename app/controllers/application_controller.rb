class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = session[:current_user]
    @current_user
  end
end
