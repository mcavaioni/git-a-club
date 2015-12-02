class Reservation < ActiveRecord::Base
  has_many :reviews, as: :reviewable
  belongs_to :renter
  belongs_to :listing
end
