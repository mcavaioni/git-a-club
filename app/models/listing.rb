# == Schema Information
#
# Table name: listings
#
#  id            :integer          not null, primary key
#  listable_type :string
#  listable_id   :integer
#  start_date    :datetime
#  finish_date   :datetime
#  price         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Listing < ActiveRecord::Base
   belongs_to :listable, polymorphic: true
   has_many :reservations
   has_many :reviews, as: :reviewable
end
