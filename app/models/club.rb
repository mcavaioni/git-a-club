class Club < ActiveRecord::Base
  has_one :generic_club
  belongs_to :provider
  belongs_to :club_set
  has_many :listings, as: :listable
 
end
