class ClubSet < ActiveRecord::Base
  has_many :clubs
  has_many :listings, as: :listable
end
