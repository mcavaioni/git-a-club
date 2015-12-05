# == Schema Information
#
# Table name: listings
#
#  id            :integer          not null, primary key
#  listable_type :string
#  listable_id   :integer
#  start_date    :date
#  finish_date   :date
#  price         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Listing < ActiveRecord::Base
  belongs_to :listable, polymorphic: true
  has_many :reservations
  has_many :reviews, as: :reviewable
  validates :start_date, :finish_date, :price, presence: true
  validate :valid_start_date


  def availability
    availability_range = (self.start_date..self.finish_date).to_a
    reservations = self.reservations.select(&:persisted?)
    reservations.each do |reservation|
      availability_range -= (reservation.start_date..reservation.finish_date).to_a
    end
    availability_range
  end

  def reservation_available?(start_date, finish_date)
    reservation_dates = (start_date..finish_date).to_a
    availability&reservation_dates == reservation_dates
  end

  private

  def valid_start_date
    if self.start_date && self.finish_date && self.start_date > self.finish_date
      errors.add(:status, "start date cannot be after finish date")
    end
  end
end
