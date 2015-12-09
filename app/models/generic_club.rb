# == Schema Information
#
# Table name: generic_clubs
#
#  id              :integer          not null, primary key
#  club_type       :string
#  brand           :string
#  male            :boolean
#  righty          :boolean
#  head_feature    :string
#  shaft_stiffness :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class GenericClub < ActiveRecord::Base
  has_many :clubs
  has_many :club_set_clubs, through: :clubs
  has_many :club_sets, through: :club_set_clubs

  ClubTypes = %w(driver putter lob_wedge gap_wedge sand_wedge pitching_wedge 2_iron_or_hybrid 3_iron_or_hybrid 4_iron_or_hybrid 5_iron_or_hybrid 6_iron 7_iron 8_iron 9_iron 3_wood 5_wood)
  HeadFeatures = %w(cavity pocket_cavity blade)
  ShaftStiffnesses = %w(senior ladies regular stiff extra-stiff)

  def self.number_of_clubs_by_type(type_of_club)
    joins(:clubs).where(active:true).where("club_type=?",type_of_club)
  end

  def self.number_by_type
    num_of_active_clubs = Club.active_clubs.count.to_f
    ClubTypes.each_with_object({}) do |club_type, type_hash|
      num_of_club_type = number_of_clubs_by_type(club_type).count
      type_hash[club_type.to_sym] = (number_of_club_type / num_of_active_clubs).round(2)
    end
  end

  def self.brand_names
    uniq.pluck(:brand)
  end

end
