class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  has_and_belongs_to_many :favorites
end
