class MainController < ApplicationController
  skip_before_filter :check_login
  
  def index
    render :about if (session[:current_user] == nil)
  end
end
