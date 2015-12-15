# == Schema Information
#
# Table name: listings
#
#  id            :integer          not null, primary key
#  listable_type :string
#  listable_id   :integer
#  start_date    :date
#  finish_date   :date
#  price         :integer
#  active        :boolean          default(TRUE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Listing < ActiveRecord::Base
  belongs_to :listable, polymorphic: true
  delegate :user, to: :listable
  has_many :reservations
  has_many :reviews, as: :reviewable
  validates :start_date, :finish_date, :price, presence: true
  validate :valid_start_date

  ### Advanced Active Record SQL
  def self.convert_to_dollars(cents)
    (cents.to_f/100.0).round(2)
  end

  def self.find_club_listings_by_user(user)
    joins("INNER JOIN clubs ON listings.listable_id = clubs.id").
    joins("INNER JOIN suppliers ON supplier_id = suppliers.id").
    joins("INNER JOIN users ON user_id = users.id").
    where("users.id = ?", user.id).where("listable_type='Club'").
    where('listings.active = true')
  end

  def self.find_club_set_listings_by_user(user)
    where(listable_type: 'ClubSet').where(active:true).
    select{|listing| listing.listable.clubs.first.supplier.user = user}
  end

  def self.average_price_active_club
    average_club_price = joins("INNER JOIN clubs ON listings.listable_id = clubs.id").
      where("clubs.active=true").where("listable_type='Club'").
      average("listings.price")
    convert_to_dollars(average_club_price)
  end

  def self.average_price_active_club_type
    average_price_club_type_hash = joins("INNER JOIN clubs ON listings.listable_id = clubs.id").
      joins("INNER JOIN generic_clubs ON generic_club_id = generic_clubs.id").
      where("clubs.active=true").where("listable_type='Club'").
      group("generic_clubs.club_type").
      average("listings.price")
    average_price_club_type_hash.each_with_object({}){|(k,v), hash| hash[k] = convert_to_dollars(v)}
  end

  def self.average_price_active_club_set
    average_club_set_price = joins("INNER JOIN club_sets ON listings.listable_id = club_sets.id").
      where("club_sets.active=true").where("listable_type='ClubSet'").
      average("listings.price")
    convert_to_dollars(average_club_set_price)
  end

  def self.percent_under_five
    listings_under_5 = where("price <= 500").count
    total_num_of_listings = all.count
    (listings_under_5/total_num_of_listings.to_f * 100).round(2)
  end

  def self.active_and_current
    where(active:true).where("finish_date >= ?", Date.current)
  end

  def self.number_of_uniq_club
    active_and_current.where(listable_type:'Club').pluck(:listable_id).uniq.count.to_f
  end

  def self.number_of_uniq_club_set
    active_and_current.where(listable_type:'ClubSet').pluck(:listable_id).uniq.count.to_f
  end

  def self.uniq_club_ratio
    (number_of_uniq_club/active_and_current.count * 100).round(2)
  end

  def self.uniq_club_set_ratio
    (number_of_uniq_club_set/active_and_current.count * 100).round(2)
  end

  def self.get_by_listable(listable)
    where(listable:listable).where(active:true).where("finish_date >= ?", Date.current)
  end

  def listing_range
    (start_date..finish_date).to_a
  end

  def availability
    availability_range = (self.start_date..self.finish_date).to_a
    reservations = self.reservations.select(&:persisted?)
    reservations.each do |reservation|
      availability_range -= (reservation.start_date..reservation.finish_date).to_a
    end
    remove_past_dates(availability_range)
  end

  def reservation_available?(start_date, finish_date)
    reservation_dates = (start_date..finish_date).to_a
    availability&reservation_dates == reservation_dates
  end

  def remove_past_dates(date_range)
    date_range.select{|date| date >= Date.current}
  end

  def format_date(date)
    "#{date.month}-#{date.day}-#{date.year}"
  end

  def display_price
    "%.2f" % (self.price/100.0)
  end

  private

  include Validable::StartDate

end
