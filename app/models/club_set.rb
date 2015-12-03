# == Schema Information
#
# Table name: club_sets
#
#  id         :integer          not null, primary key
#  summary    :string
#  name       :string
#  picture    :string

#  active     :boolean

#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ClubSet < ActiveRecord::Base
  has_many :club_set_clubs
  has_many :clubs, through: :club_set_clubs
  has_many :suppliers, through: :clubs
  has_many :listings, as: :listable
end
