require 'spec_helper'
RSpec.describe Reservation do 
  describe"#reservation_available_validation" do 
    context 'validate dates for reservation' do
      let(:listing) {FactoryGirl.build :listing}
      let(:start_date) {listing.start_date}
      let(:finish_date) {listing.finish_date}
      let(:reservation) {listing.reservations.build(start_date: start_date, finish_date: finish_date)}
      it 'returns true for valid dates' do
        expect(reservation.save).to be true
      end

      it 'return false for invalid dates' do
        reservation.finish_date=finish_date+1
        expect(reservation.save).to be false
      end
      let(:reservation_1 ) {listing.reservations.build(start_date:Date.new(2015,12,3), finish_date:Date.new(2015,12,5))}
      let(:reservation_2 ) {listing.reservations.build(start_date:Date.new(2015,12,2), finish_date:Date.new(2015,12,6))}
      
      it 'return false for overlapping reservations' do 
        reservation_1.save
        expect(reservation_2.save).to be false
      end
    end
  end
    

end
