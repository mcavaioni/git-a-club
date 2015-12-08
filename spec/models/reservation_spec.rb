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

    describe 'cannot destroy a reservation 7 days prior to start date' do
      let(:listing) {FactoryGirl.build :listing}
      before (:each) do
        @date_now = Date.new(2015,12,1)
        @reservation1 = listing.reservations.build(start_date: Date.new(2015, 12, 9), finish_date: Date.new(2015, 12, 9))
        @reservation2 = listing.reservations.build(start_date: Date.new(2015, 12, 8), finish_date: Date.new(2015, 12, 8))
        @reservation3 = listing.reservations.build(start_date: Date.new(2015, 12, 7), finish_date: Date.new(2015, 12, 7))
        @reservation1.save
        @reservation2.save
        @reservation3.save
        Date.stub(:current).and_return(@date_now)
      end

      it 'validates on deletion' do
        @reservation1.destroy
        @reservation2.destroy
        @reservation3.destroy
        @listing = Listing.find(@reservation1.listing_id)

        expect(@listing.reservations).to_not include(@reservation1)
        expect(@listing.reservations).to include(@reservation2)
        expect(@listing.reservations).to include(@reservation3)
      end
    end
  end

  describe 'sql functions' do
    before(:each) do
      Reservation.stub(:valid_deletion).and_return(true)
      Reservation.destroy_all
      @date_now = Date.new(2015,12,5)
      @listing = Listing.create(start_date: Date.new(2015, 12, 1), finish_date: Date.new(2015, 12, 30), price: 5)
      @renter = Renter.create()
      @reservation1 = @renter.reservations.build(start_date: Date.new(2015,12,1), finish_date: Date.new(2015,12,1), listing_id: @listing.id)
      @reservation2 = @renter.reservations.build(start_date: Date.new(2015,12,2), finish_date: Date.new(2015,12,4), listing_id: @listing.id)
      @reservation3 = @renter.reservations.build(start_date: Date.new(2015,12,5), finish_date: Date.new(2015,12,5), listing_id: @listing.id)
      @reservation4 = @renter.reservations.build(start_date: Date.new(2015,12,7), finish_date: Date.new(2015,12,10), listing_id: @listing.id)
      @reservation5 = @renter.reservations.build(start_date: Date.new(2015,12,10), finish_date: Date.new(2015,12,30), listing_id: @listing.id)
      @renter.save
      @upcoming = [@reservation3, @reservation4, @reservation5]
      @past = [@reservation1, @reservation2]

      Date.stub(:current).and_return(@date_now)
    end

    describe ".self.upcoming_reservations" do 
      it 'returns only upcoming reservations for a specific renter' do
        expect(Reservation.upcoming_reservations_by(@renter)).to match_array(@upcoming)
      end
    end

    describe ".self.past_reservations" do 
      it 'returns only past reservations for a specifc renter' do
        expect(Reservation.past_reservations_by(@renter)).to match_array(@past)
      end
    end
  end
end
