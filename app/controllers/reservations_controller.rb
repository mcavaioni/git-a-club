class ReservationsController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = @listing.reservations.build(reservation_params)
    @reservation.save
    redirect_to listing_reservation_path(@listing, @reservation)
  end

  def show

  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :finish_date)
  end

end
