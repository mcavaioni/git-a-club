class Club < ActiveRecord::Base
  belongs_to :provider_profile
  belongs_to :club_set
  has_many :listings, as: :listable
 
end
