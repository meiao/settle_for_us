class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  has_many :favorites
end
