# == Schema Information
#
# Table name: club_set_clubs
#
#  id          :integer          not null, primary key
#  club_set_id :integer
#  club_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ClubSetClub < ActiveRecord::Base
  has_many :club_sets
  has_many :clubs
end
