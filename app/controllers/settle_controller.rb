class SettleController < ApplicationController
  def settle
    four2_client = Foursquare2::Client.new(:oauth_token => session[:current_user][:oauth_token])
    locals = four2_client.explore_venues(:ll => params[:ll], :radius => 500, :section => 'food')[:groups][0][:items]
    num = rand(locals.length)
    @local = locals[num][:venue]
  end
  
  def try_again
    
  end
end
