class FavoritesController < ApplicationController

  def list
    
  end
  
  def settle
    
  end
  
  def search
    
  end
  
  def add
    begin
      User.find(current_user[:id]).favorites.create(:venue_id => params[:venue])
    rescue
      # just ignore the exception and let the user go to the favorites page      
    end
    redirect_to(:controller => 'main')
  end
  
  def remove
    venue = User.find(current_user[:id]).favorites.where(:venue_id => params[:venue]).first
    venue.destroy if (venue != nil)
    redirect_to(:controller => 'main')    
  end
  
end
