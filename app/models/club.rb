# == Schema Information
#
# Table name: clubs
#
#  id              :integer          not null, primary key
#  provider_id     :integer
#  club_set_id     :integer
#  generic_club_id :integer
#  condition       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Club < ActiveRecord::Base
  has_one :generic_club
  belongs_to :provider
  belongs_to :club_set
  has_many :listings, as: :listable

  # These conditions were taken from Kelley Blue Book
  Conditions = ['excellent','very_good','good','fair']

end
