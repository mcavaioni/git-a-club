# == Schema Information
#
# Table name: reservations
#
#  id          :integer          not null, primary key
#  renter_id   :integer
#  start_date  :date
#  finish_date :date
#  listing_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Reservation < ActiveRecord::Base
  has_many :reviews, as: :reviewable
  belongs_to :renter
  belongs_to :listing
  validate :reservation_available_validation
  # add validations for creating a resevation

  private

  def reservation_available_validation
    if (self.start_date && self.finish_date)
      if !self.listing.reservation_available?(self.start_date, self.finish_date)
        errors.add(:status, "invalid reservation")
      end
    end
  end
end
