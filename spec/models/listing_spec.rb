require 'spec_helper'
RSpec.describe Listing do 
  context 'available dates' do
    let(:listing) {FactoryGirl.build :listing}
    let (:result) {(listing.start_date..listing.finish_date).to_a}
    it 'returns date as available' do
      expect(listing.availability).to match_array(result)
    end

        #reservation: check new availability

  end

  context 'availability of reservation' do
    let (:listing) {FactoryGirl.build :listing}
    let(:start_date) {listing.start_date}
    let(:finish_date) {listing.finish_date}
    it 'returns true for dates that are available' do
      expect(listing.reservation_available?(start_date, finish_date)).to eq true
    end

    let(:bad_start_date) {listing.start_date}
    let(:bad_finish_date) {listing.finish_date+1}
    it 'returns false for dates taht are noe available' do
      expect(listing.reservation_available?(bad_start_date, bad_finish_date)).to eq false
    end
  end
end