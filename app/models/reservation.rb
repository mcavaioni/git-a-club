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
  delegate :supplier, to: :listing
  validates :start_date, :finish_date, presence: true
  validate :reservation_available_validation, :valid_start_date

  before_destroy :valid_deletion

  def self.upcoming_reservations_by(obj)
    self.where(obj.class.to_s.downcase.to_sym => obj).where("finish_date >= ?", Date.current)
  end

  def self.past_reservations_by(obj)
    self.where(obj.class.to_s.downcase.to_sym => obj).where("finish_date < ?", Date.current)
  end

  def format_date(date)
    "#{date.month}-#{date.day}-#{date.year}"
  end

  private

  include Validable::StartDate

  def valid_deletion
    if Date.current + 7 >= self.start_date
      errors.add(:status, "cannot cancel a reservation 7 days prior to start date")
      return false
    end
  end

  def reservation_available_validation
    if (self.start_date && self.finish_date)
      if !self.listing.reservation_available?(self.start_date, self.finish_date)
        errors.add(:status, "invalid reservation")
      end
    end
  end
end
