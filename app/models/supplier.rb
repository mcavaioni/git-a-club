# == Schema Information
#
# Table name: suppliers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Supplier < ActiveRecord::Base
  belongs_to :user
  has_many :clubs
  has_many :club_set_clubs, through: :clubs
  has_many :club_sets, through: :club_set_clubs
  has_many :listings, through: :clubs
  has_many :listings, through: :club_sets
end
