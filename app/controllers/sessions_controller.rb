class SessionsController < ApplicationController
  skip_before_filter :check_login

  def create
    auth = request.env["omniauth.auth"]
    provider = auth.provider
    uid = auth.uid
    
    user = User.where(:provider => provider, :uid => uid)[0]
    
    if user == nil
      user = User.new
      user.provider = provider
      user.uid = uid
      user.name = auth.info.name
      user.save
    end
    session[:current_user] = {:name => user.name, :id => user.id, :oauth_token => auth.credentials.token}
    redirect_to(:controller => 'main')
  end
  
  def logout
    reset_session
    redirect_to(:controller => 'main')
  end

end
