# == Schema Information
#
# Table name: club_sets
#
#  id         :integer          not null, primary key
#  summary    :string
#  name       :string
#  picture    :string
#  active     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

#  active     :boolean

#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ClubSet < ActiveRecord::Base
  has_many :club_set_clubs
  has_many :clubs, through: :club_set_clubs, dependent: :destroy
  has_many :suppliers, through: :clubs
  has_many :listings, as: :listable
  has_many :generic_clubs, through: :clubs

  validate :all_same_hand, :all_same_gender
  validate :required_wedges, :required_clubs

  def self.find_by_generic_clubs(generic_club_array)
    # where(generic_club:generic_club_array)
    # joins(clubs: :generic_club).where(generic_club:generic_club_array)
    # joins(club_set_clubs:{club: :generic_club}).where("generic_clubs.club_type IN (?)",['3_wood','putter']).select("COUNT(club_sets.id) AS total_clubs")
    # ClubSet.select("club_sets.*, count(club_sets.id) as clubs_in_set").joins(club_set_clubs:{club: :generic_club})
    # ClubSet.select("club_sets.*, count(club_sets.id) as clubs_in_set").joins(club_set_clubs:{club: :generic_club}).group("club_sets.id").having("generic_clubs.club_type IN (?)",['3_wood','putter'])
  end

  def description
    first_club = self.clubs.first
    number_of_clubs = self.clubs.length
    "#{number_of_clubs} club set #{first_club.gender_handed}"
  end

  # ClubSet.joins(club_set_clubs:{club: :generic_club})
  # ClubSet.joins(club_set_clubs:{club: :generic_club}).where("generic_clubs.club_type = ?",['3_wood'])

  private

  include Validable::ClubSetValidations

end
