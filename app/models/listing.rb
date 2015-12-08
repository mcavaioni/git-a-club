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
  delegate :user, to: :listable
  has_many :reservations
  has_many :reviews, as: :reviewable
  validates :start_date, :finish_date, :price, presence: true
  validate :valid_start_date
  validate :valid_finish_date

  def self.get_by(clubs)
    where(listable:clubs)
  end

  def as_json(options={})
    super(:only => [:id,:listable_id,:city,:listable_type,:start_date,:finish_date,:price],
          :include => {
            :listable => {:only => [:condition, :id],
              :include => {
                :generic_club => {only:[:club_type,:brand,:male,:righty,:head_feature,:shaft_stiffness]}
              }
            }
        }
    )
  end

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

  include Validable::StartDate

end
