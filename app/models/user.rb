class User < ActiveRecord::Base
  has_many :providers
  has_many :renters
  has_many :listings, through: :providers
  has_many :reservations, through: :renters
  
end
