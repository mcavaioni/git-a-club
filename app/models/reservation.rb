class Reservation < ActiveRecord::Base
  has_many :reviews, as: :reviewable
  belongs_to :renter_profile
  belongs_to :listing
end
