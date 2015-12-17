# == Schema Information
#
# Table name: clubs
#
#  id              :integer          not null, primary key
#  supplier_id     :integer
#  generic_club_id :integer
#  condition       :string
#  picture         :string
#  active          :boolean          default(TRUE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Club < ActiveRecord::Base
  has_many :club_set_clubs
  has_many :club_sets, through: :club_set_clubs
  belongs_to :generic_club
  belongs_to :supplier
  has_many :listings, as: :listable

  after_save :club_set_member

  # accepts_nested_attributes_for :generic_club

  # These conditions were taken from Kelley Blue Book
  Conditions = ['excellent','very_good','good','fair']

  def self.find_by_generic_clubs(generic_club_array)
    where(generic_club:generic_club_array).where(active:true)
  end

  def self.active_clubs
    Club.where(active:true)
  end

  def generic_club_attributes=(generic_club_attributes_hash)
    # generic_club_attributes_hash[:brand].downcase!
    generic_club = GenericClub.find_or_create_by(generic_club_attributes_hash)
    self.generic_club_id = generic_club.id
  end

  def club_attributes
    "#{self.generic_club.brand} - #{self.generic_club.club_type}"
  end

  def gender_handed
    handed = generic_club.righty ? "R" : "L"
    gender = generic_club.male ? "M" : "W"
    "(#{gender}:#{handed})"
  end

  def description
    "#{generic_club.brand} #{generic_club.club_type.capitalize} #{gender_handed}"
  end

  def complete_description
    "#{description}\nHead Feature: #{generic_club.head_feature}\nShaft Stiffness: #{generic_club.shaft_stiffness}\nCondition: #{condition}"
  end

  def club_set_member
   if !self.active
      self.club_sets.each do |club_set|
        club_set.active = false
        club_set.save
      end
    end
  end
end
