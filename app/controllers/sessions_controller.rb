class SessionsController < ApplicationController
  
  def create
    auth = request.env["omniauth.auth"]
    provider = auth.provider
    uid = auth.uid
    
    user = User.where(:provider => provider, :uid => uid)[0]
    
    if user == nil
      user = User.new
      user.provider = provider
      user.uid = uid
      user.name = auth.info.first_name + ' ' + auth.info.last_name
      user.save
    end
    session[:current_user] = {:name => user.name, :id => user.id, :oauth_token => auth.credentials.token}
    redirect_to(:controller => 'main')
    
  end
  
  def logout
    session[:current_user] = nil
    redirect_to(:controller => 'main')
  end
end
