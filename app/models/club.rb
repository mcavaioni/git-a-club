# == Schema Information
#
# Table name: clubs
#
#  id              :integer          not null, primary key
#  supplier_id     :integer
#  club_set_id     :integer
#  generic_club_id :integer
#  condition       :string
#  picture         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Club < ActiveRecord::Base
  belongs_to :generic_club
  belongs_to :supplier
  belongs_to :club_set
  has_many :listings, as: :listable



  # These conditions were taken from Kelley Blue Book
  Conditions = ['excellent','very_good','good','fair']

  def generic_club_attributes=(generic_club_attributes_hash)
    generic_club_attributes_hash[:brand].downcase!
    binding.pry
    GenericClub.find_or_create_by(generic_club_attributes_hash)
  end

end
