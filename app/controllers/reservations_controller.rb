class ReservationsController < ApplicationController
  before_action :find_renter, only: [:index, :create, :show, :destroy]
  before_action :find_reservation, only: [:destroy, :show]

  def new
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = @renter.reservations.build(reservation_params)
    @listing = Listing.find(@reservation.listing_id)
    @reservation.valid?
    render json: ReservationJsonViewObject.new(@reservation).get_json_for_reservation
  end

  def charge
    @renter = Renter.find(current_user.renter.id)
    @reservation = @renter.reservations.build(reservation_params)
    @reservation.save
    flash[:notice] = 'Reservation Confirmed!'
    redirect_to renter_reservations_path(@renter)
  end

  def index
    @upcoming_reservations = Reservation.upcoming_reservations_by(@renter)
    @past_reservations = Reservation.past_reservations_by(@renter)
  end

  def show
    # @supplier = @reservation.listing.listable.supplier.user
    render json: ReservationDetailsViewObject.new(@reservation).get_json
  end

  def show_upcoming
    @upcoming_reservations = Reservation.upcoming_reservations_by(current_user.renter)
    render json: {reservations: ReservationsJsonViewObject.new(@upcoming_reservations).get_json }
  end

  def show_past
    @past_reservations = Reservation.past_reservations_by(current_user.renter)
    render json: {reservations: ReservationsJsonViewObject.new(@past_reservations).get_json }
  end

  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html redirect_to renter_reservations_path(@renter)
      format.json render json: {errors: @reservation.errors.messages[:status]}
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :finish_date, :listing_id)
  end

  def find_renter
    @renter = Renter.find(params[:renter_id])
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end

end
