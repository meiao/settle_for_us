class FavoritesController < ApplicationController

  def list
    @favorites = get_user_favorites(current_user[:id])
    render :no_favorites if @favorites.empty?
  end
  
  def search
    four2_client = Foursquare2::Client.new(:oauth_token => session[:current_user][:oauth_token])
    @venues = four2_client.search_venues(:query => params[:name], :intent => 'global')[:groups][0][:items]
    @favorites = get_user_favorites(current_user[:id])
  end
  
  def settle
    @favorites = get_user_favorites(current_user[:id])
    render :no_favorites if @favorites.empty?
    num = rand(@favorites.length)
    @selected = @favorites[num]
  end
  
  def add
    venue = get_venue(params[:venue])
    favorite = Favorite.where(:venue_id => venue.id)
    if favorite.empty?
      favorite = Favorite.new
      favorite.name = venue.name
      favorite.canonicalUrl = venue.canonicalUrl
      favorite.venue_id = venue.id
      favorite.address = [venue.location.address, venue.location.city].compact.join(' - ')
      favorite.save
    end
    User.find(current_user[:id]).favorites << favorite
    redirect_to(:controller => 'favorites', :action => 'list')
  end
  
  def remove
    favorite = Favorite.where(:venue_id => params[:venue])
    User.find(current_user[:id]).favorites.delete(favorite)
    redirect_to(:controller => 'favorites', :action => 'list')
  end

  private
  
  def get_venue(venue_id)
    four2_client = Foursquare2::Client.new(:oauth_token => session[:current_user][:oauth_token])
    return four2_client.venue(venue_id)
  end

  def get_user_favorites(user_id)
    venues = User.find(user_id).favorites
    venues.each do |f|
      if f.updated_at < 15.days.ago
        venue = get_venue(f.venue_id)
        f.name = venue.name
        f.canonicalUrl = venue.canonicalUrl
        f.address = [venue.location.address, venue.location.city].compact.join(' - ')
        f.save
      end
    end
    return venues
  end
end
