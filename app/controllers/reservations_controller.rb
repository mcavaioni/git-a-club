class ReservationsController < ApplicationController
  before_action :find_renter, only: [:index, :create]

  def new
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.new
  end

  def create
    # binding.pry
    @reservation = @renter.reservations.build(reservation_params)

    if @reservation.save
      # binding.pry
      # redirect_to renter_reservations_path(@renter)
      reservation_dates = @reservation.start_date..@reservation.finish_date
      render json: {:notice => 'Confirmed', dateData: reservation_dates}
    else
      # binding.pry
      # flash.now[:notice] = 'Dates are not available.'
      render json: {:notice => @reservation.errors.full_messages}
    end
  end

  def index
    @upcoming_reservations = Reservation.upcoming_reservations_by(@renter)
    @past_reservations = Reservation.past_reservations_by(@renter)
  end

  def show

  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :finish_date, :listing_id)
  end

  def find_renter
    @renter = Renter.find(params[:renter_id])
  end

end
