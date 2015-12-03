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
end
