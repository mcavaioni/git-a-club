class ListingsController < ApplicationController
  # before_action :find_user, only: [:supplier_listings]
  # before_action :find_supplier, only: [:new, :create, :supplier_listings]
  # before_action :find_club, only: [:new, :create]
  # before_action :find_club_set, only: [:new, :create]
  before_action :find_supplier, only: [:supplier_listings]

  def new
    @listing = Listing.new
  end

  def index
    @listings = Listing.all
    @brands = GenericClub.brand_names
    @generic_clubs = GenericClub.all
  end

  def supplier_listings
    @club_listings = @supplier.listable_listings('clubs')
    @club_set_listings = @supplier.listable_listings('club_sets').uniq
    render 'listings/supplier_index.html.erb'
  end

  # def four_listings
  #   start_load = (params[:start_row]).to_i
  #   listings = Listing.all
  #   html_string = render_to_string 'listings/_listing_row', locals: {listings: listings, start_load:start_load}, layout: false
  #   render json: {new_row: html_string}
  # end

  def show
    @listing = Listing.find(params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render json: ListingsJsonViewObject.new([@listing]).collect_listings_json}
    end
  end

  def create
    priced_params = listing_params
    priced_params[:price] = listing_params[:price].to_i * 100
    @listing = Listing.new(priced_params)

    if @listing.save
      html_string = render_to_string 'listings/_listing', locals: {listing: @listing}, layout: false
      render json: {template: html_string}
    else
      render json: {errors: 'Dates selected are not correct.'}
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.active = false
    @listing.save
    render json: {errors: @listing.errors.messages[:status]}
  end

  private

  def listing_params
    params.require(:listing).permit(:start_date, :finish_date, :price, :listable_type, :listable_id)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_supplier
    @supplier = Supplier.find(params[:supplier_id])
  end

  def find_club
    @club = Club.find_by(id: params[:club_id])
  end

  def find_club_set
    @club_set = ClubSet.find_by(id: params[:club_set_id])
  end
end
