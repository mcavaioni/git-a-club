require 'spec_helper'

RSpec.describe Listing do 
  describe"#availability" do
    context 'available dates' do
      let(:listing) {FactoryGirl.build :listing}
      let (:result) {(listing.start_date..listing.finish_date).to_a}
      it 'returns date as available' do
        expect(listing.availability).to match_array(result)
      end
    end
  end

  describe "#reservation_available?" do
    context 'availability of reservation' do
      let (:listing) {FactoryGirl.build :listing}
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
end