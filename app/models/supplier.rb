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
  # has_many :listings, as: :listable, through: :clubs
  # has_many :listings, as: :listable, through: :club_sets

  def club_listings
    self.clubs.map(&:listings).flatten
  end

  def club_set_listings
    self.club_sets.map(&:listings).flatten
  end
end
