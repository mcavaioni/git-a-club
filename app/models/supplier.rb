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

  def listable_listings(listable)
    all_club_listings = self.send(listable).map(&:listings).flatten
    all_club_listings.select{|listing| listing.active && listing.finish_date >= Date.current}
  end
end
