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
  validate :all_same_hand, :all_same_gender

  def description
    first_club = self.clubs.first
    number_of_clubs = self.clubs.length
    "#{number_of_clubs} club set #{first_club.gender_handed}"
  end

  private

  include Validable::ClubSetValidations

end
