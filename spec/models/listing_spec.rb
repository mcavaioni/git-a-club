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

require 'spec_helper'

RSpec.describe Listing do 
  describe 'instance methods' do 
    describe"#availability" do
      before(:each){ Date.stub(:current).and_return(Date.new(1000,1,1)) }
      
      context 'available dates' do
        let(:listing) {FactoryGirl.build :listing}
        let (:result) {(listing.start_date..listing.finish_date).to_a}
        it 'returns date as available' do
          expect(listing.availability).to match_array(result)
        end
      end
    end

    describe "#reservation_available?" do
      before(:each){ Date.stub(:current).and_return(Date.new(1000,1,1)) }
      
      context 'availability of reservation' do
        let(:listing) {FactoryGirl.build :listing}
        let(:start_date) {listing.start_date}
        let(:finish_date) {listing.finish_date}
        it 'returns true for dates that are available' do
          expect(listing.reservation_available?(start_date, finish_date)).to eq true
        end

        let(:bad_start_date) {listing.start_date}
        let(:bad_finish_date) {listing.finish_date+1}
        it 'returns false for dates that are noe available' do
          expect(listing.reservation_available?(bad_start_date, bad_finish_date)).to eq false
        end
      end
    end

    describe '#remove_past_dates' do
      context 'deletes days prior to current date from availability' do
        before(:each) do
          @listing = Listing.create(start_date: Date.new(2015, 12, 1), finish_date: Date.new(2015, 12, 10), price: 15)
          @date_now = Date.new(2015, 12, 5)
          Date.stub(:current).and_return(@date_now)
          @return_array = (Date.current..@listing.finish_date).to_a
        end
        it 'returns an array with less dates due to current date being in the middle of the listing dates' do
          expect(@listing.availability).to match_array(@return_array)
        end
      end
    end
  end

  describe 'listing validations' do
    before (:each) do
      @valid_listing = Listing.create(start_date: Date.new(2015, 12, 1), finish_date: Date.new(2015, 12, 10), price: 5)
      @no_start_date = Listing.create(finish_date: Date.new(2015, 12, 10), price: 5)
      @no_finish_date = Listing.create(start_date: Date.new(2015, 12, 10), price: 5)
      @start_after_finish = Listing.create(start_date: Date.new(2015, 12, 11), finish_date: Date.new(2015, 12, 10), price: 5)
      @start_on_finish = Listing.create(start_date: Date.new(2015, 12, 10), finish_date: Date.new(2015, 12, 10), price: 5)
      @no_price = Listing.create(start_date: Date.new(2015, 12, 1), finish_date: Date.new(2015, 12, 10))
    end
      
    it 'validates a listing with start date and end date' do
      expect(@valid_listing).to be_valid
    end

    it 'validates a listing with no start date' do
      expect(@no_start_date).to_not be_valid
    end

    it 'validates a listing with no finish date' do
      expect(@no_finish_date).to_not be_valid
    end

    it 'validates a listing with the same start and finish date' do
      expect(@start_on_finish).to be_valid
    end

    it 'validates a listing with the a start date after finish date' do
      expect(@start_after_finish).to_not be_valid
    end

    it 'validates a listing with no price' do
      expect(@no_price).to_not be_valid
    end
  end

  describe 'advanced Active Record SQL queries' do
    before(:each) do
      GenericClub.destroy_all
      Club.destroy_all
      Listing.destroy_all

      @driver = GenericClub.create(club_type: 'driver', brand: 'Flatiron', male: true, righty: true, head_feature: 'cavity', shaft_stiffness: 'senior')
      @putter = GenericClub.create(club_type: 'putter', brand: 'Flatiron', male: true, righty: true, head_feature: 'cavity', shaft_stiffness: 'senior')
      @wedge = GenericClub.create(club_type: 'log_wedge', brand: 'Flatiron', male: true, righty: true, head_feature: 'cavity', shaft_stiffness: 'senior')
      @five_iron = GenericClub.create(club_type: '5_iron_or_hybrid', brand: 'Flatiron', male: true, righty: true, head_feature: 'cavity', shaft_stiffness: 'senior')
      @six_iron = GenericClub.create(club_type: '6_iron', brand: 'Flatiron', male: true, righty: true, head_feature: 'cavity', shaft_stiffness: 'senior')
      @seven_iron = GenericClub.create(club_type: '7_iron', brand: 'Flatiron', male: true, righty: true, head_feature: 'cavity', shaft_stiffness: 'senior')
      @eight_iron = GenericClub.create(club_type: '8_iron', brand: 'Flatiron', male: true, righty: true, head_feature: 'cavity', shaft_stiffness: 'senior')
      @nine_iron = GenericClub.create(club_type: '9_iron', brand: 'Flatiron', male: true, righty: true, head_feature: 'cavity', shaft_stiffness: 'senior')
      @three_wood = GenericClub.create(club_type: '3_wood', brand: 'Flatiron', male: true, righty: true, head_feature: 'cavity', shaft_stiffness: 'senior')
      @five_wood = GenericClub.create(club_type: '4_wood', brand: 'Flatiron', male: true, righty: true, head_feature: 'cavity', shaft_stiffness: 'senior')
      
      @club1 = @driver.clubs.build(condition: 'excellent', active: true)
      @club2 = @putter.clubs.build(condition: 'excellent', active: true)
      @club3 = @wedge.clubs.build(condition: 'excellent', active: true)
      @club4 = @five_iron.clubs.build(condition: 'excellent', active: true)
      @club5 = @six_iron.clubs.build(condition: 'excellent', active: true)
      @club6 = @seven_iron.clubs.build(condition: 'excellent', active: true)
      @club7 = @eight_iron.clubs.build(condition: 'excellent', active: true)
      @club8 = @nine_iron.clubs.build(condition: 'excellent', active: true)
      @club9 = @three_wood.clubs.build(condition: 'excellent', active: false)
      @club10 = @five_wood.clubs.build(condition: 'excellent', active: false)

      [@club1, @club2, @club3, @club4, @club5, @club6, @club7, @club8, @club9, @club10].each(&:save)

      @date1 = Date.new(2015,12,1)
      @date2 = Date.new(2015,12,3)
      @date3 = Date.new(2015,12,5)
      @date4 = Date.new(2015,12,8)
      @date5 = Date.new(2015,12,12)
      @date6 = Date.new(2015,12,15)
      @date7 = Date.new(2015,12,18)
      @date8 = Date.new(2015,12,19)
      @date9 = Date.new(2015,12,23)
      @date10 = Date.new(2015,12,25)
      @date11 = Date.new(2015,12,30)

      @club1.listings.build(start_date: @date1, finish_date: @date2, price: 10) #5 days
      @club2.listings.build(start_date: @date2, finish_date: @date5, price: 17) #10 days
      @club3.listings.build(start_date: @date4, finish_date: @date7, price: 25) #11 days
      @club4.listings.build(start_date: @date3, finish_date: @date10, price: 31) #21 days
      @club5.listings.build(start_date: @date5, finish_date: @date8, price: 40) #8 days
      @club6.listings.build(start_date: @date6, finish_date: @date9, price: 44) #9 days
      @club7.listings.build(start_date: @date7, finish_date: @date9, price: 48) #6 days
      @club8.listings.build(start_date: @date8, finish_date: @date10, price: 55) #7 days
      @club9.listings.build(start_date: @date9, finish_date: @date11, price: 60) #8 days
      @club10.listings.build(start_date: @date10, finish_date: @date11, price: 88) #6 days

      [@club1, @club2, @club3, @club4, @club5, @club6, @club7, @club8, @club9, @club10].each(&:save)
    end

    describe '.average_active_price' do
      context 'average price of all active clubs' do
        it 'returns average price of ' do
          #33.75
        end
      end
    end
  end
end
