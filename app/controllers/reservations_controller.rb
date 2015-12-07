class ReservationsController < ApplicationController
  before_action :find_renter, only: [:index, :create]

  def new
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = @renter.reservations.build(reservation_params)
    @listing = Listing.find(@reservation.listing_id)
    if @reservation.save
      flash[:notice] = 'Reservation Confirmed!'
      redirect_to renter_reservations_path(@renter)
      # new_listing_dates = @listing.availability.to_s
      # render json: {:notice => 'Confirmed', dateData: new_listing_dates}
    else
      flash[:notice] = 'Selected dates are not available.'
      redirect_to @listing
      # render json: {:notice => @reservation.errors.full_messages}      
      # render 'listings/show'
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
