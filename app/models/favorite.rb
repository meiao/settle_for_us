class Favorite < ActiveRecord::Base
  attr_accessible :venue_id, :name, :canonicalUrl
  has_and_belongs_to_many :user
end
