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


  def availability
    availability_range = (self.start_date..self.finish_date).to_a
    self.reservations[0..-2].each do |reservation|
      (reservation.start_date..reservation.finish_date).each do |date|
        availability_range.delete(date)
      end
    end
    availability_range
  end

  def reservation_available?(start_date, finish_date)
    reservation_dates = (start_date..finish_date).to_a

    availability&reservation_dates == reservation_dates
  end
end
