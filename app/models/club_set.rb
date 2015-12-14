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

  def supplier
    self.clubs.first.supplier
  end

  def self.club_sets_by_size
    club_set_sizes = select("club_sets.id").joins(:clubs).where("club_sets.active=true")
    .group('club_sets.id').count('clubs')
    club_set_sizes.values.uniq.each_with_object({}) do |size, hash|
      hash[size] = club_set_sizes.values.count(size)
    end
  end

  def self.find_sets_where(search_params)
    # add step to remove the required clubs from the search
    # find by gender and hand - hold off on this
    search_params[:club_type] ||= ["putter"]
    sets_array = find_by_each_type(search_params[:club_type])
    get_intersection_of_sets(sets_array)

  end

  def self.find_by_each_type(types)
    types.collect do |club_type|
      find_sets_by_single_type(club_type)
    end
  end

  def self.find_sets_by_single_type(club_type)
    joins(:generic_clubs).where("generic_clubs.club_type = ?", club_type)
  end

  def self.get_intersection_of_sets(sets_array)
    first_set = sets_array[0]
    sets_array.inject(first_set) do |set_array, intersection|
      intersection = intersection & set_array
    end
  end

  def self.find_by_gender_hand(gender, hand)

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
