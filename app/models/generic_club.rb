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

  ClubTypes = %w(driver putter lob_wedge gap_wedge sand_wedge pitch_wedge 2_iron_or_hybrid 3_iron_or_hybrid 4_iron_or_hybrid 5_iron_or_hybrid 6_iron 7_iron 8_iron 9_iron 3_wood 5_wood)
  HeadFeatures = %w(cavity pocket_cavity blade)
  ShaftStiffnesses = %w(senior ladies regular stiff extra-stiff)



  def self.brand_names
    uniq.pluck(:brand)
  end

end
