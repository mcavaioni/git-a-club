require 'spec_helper'

RSpec.describe Reservation do  
  describe 'reservations valdiations' do 
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

    describe 'start and finish date validations' do
      let(:listing) {FactoryGirl.build :listing}
      before (:each) do
        @valid_reservation = listing.reservations.build(start_date: Date.new(2015, 12, 1), finish_date: Date.new(2015, 12, 10))
        @no_start_date = listing.reservations.build(finish_date: Date.new(2015, 12, 10))
        @no_finish_date = listing.reservations.build(start_date: Date.new(2015, 12, 10))
        @start_after_finish = listing.reservations.build(start_date: Date.new(2015, 12, 11), finish_date: Date.new(2015, 12, 10))
        @start_on_finish = listing.reservations.build(start_date: Date.new(2015, 12, 10), finish_date: Date.new(2015, 12, 10))
      end

      it 'validates a reservation with start date and end date' do
        expect(@valid_reservation).to be_valid
      end

      it 'validates a reservation with no start date' do
        expect(@no_start_date).to_not be_valid
      end

      it 'validates a reservation with no end date' do
        expect(@no_finish_date).to_not be_valid
      end

      it 'validates a reservation with the same start and finish date' do
        expect(@start_on_finish).to be_valid
      end

      it 'validates a reservation with the a start date after finish date' do
        expect(@start_after_finish).to_not be_valid
      end
    end
  end
end
