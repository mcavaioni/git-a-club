# == Schema Information
#
# Table name: clubs
#
#  id              :integer          not null, primary key
#  supplier_id     :integer
#  generic_club_id :integer
#  active          :boolean
#  club_set_id     :integer
#  condition       :string
#  picture         :string

#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Club < ActiveRecord::Base
  has_many :club_set_clubs
  has_many :club_sets, through: :club_set_clubs
  belongs_to :generic_club
  belongs_to :supplier
  has_many :listings, as: :listable

  accepts_nested_attributes_for :generic_club

  # These conditions were taken from Kelley Blue Book
  Conditions = ['excellent','very_good','good','fair']

  # def generic_club_attributes=(generic_club_attributes_hash)
  #   generic_club_attributes_hash[:brand].downcase!
  #   generic_club = GenericClub.find_or_create_by(generic_club_attributes_hash)
  #   generic_club_id = generic_club.id
  # end

  def club_attributes
    "#{self.generic_club.brand} - #{self.generic_club.club_type}"
  end

end
