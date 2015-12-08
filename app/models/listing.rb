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
#  active        :boolean          default(TRUE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Listing < ActiveRecord::Base
  belongs_to :listable, polymorphic: true
  delegate :user, to: :listable
  has_many :reservations
  has_many :reviews, as: :reviewable
  validates :start_date, :finish_date, :price, presence: true
  validate :valid_start_date

  def self.get_by_clubs(clubs)
    where(listable:clubs)
  end

  def availability
    availability_range = (self.start_date..self.finish_date).to_a
    reservations = self.reservations.select(&:persisted?)
    reservations.each do |reservation|
      availability_range -= (reservation.start_date..reservation.finish_date).to_a
    end
    remove_past_dates(availability_range)
  end

  def reservation_available?(start_date, finish_date)
    reservation_dates = (start_date..finish_date).to_a
    availability&reservation_dates == reservation_dates
  end

  def remove_past_dates(date_range)
    date_range.select{|date| date >= Date.current}
  end

  def format_date(date)
    "#{date.month}-#{date.day}-#{date.year}"
  end

  private

  include Validable::StartDate

end
