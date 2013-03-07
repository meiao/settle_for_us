class Favorite < ActiveRecord::Base
  attr_accessible :venue_id
  belongs_to :user
end
