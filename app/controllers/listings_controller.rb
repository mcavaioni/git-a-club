class ListingsController < ApplicationController
  # before_action :find_user, only: [:supplier_listings]
  # before_action :find_supplier, only: [:new, :create, :supplier_listings]
  # before_action :find_club, only: [:new, :create]
  # before_action :find_club_set, only: [:new, :create]

  def index
    @listings = Listing.all
    @brands = GenericClub.brand_names
    @generic_clubs = GenericClub.all
  end

  def supplier_listings
    @listings = @supplier.listings
    render 'listings/index.html.erb'
  end

  def four_listings
    start_load = (params[:start_row]).to_i
    listings = Listing.all
    html_string = render_to_string 'listings/_listing_row', locals: {listings: listings, start_load:start_load}, layout: false
    render json: {new_row: html_string}
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    # binding.pry
    # @listing.save
    # redirect_to @listing
    # if @club
    #   @listing_club = @club.listings.build(listing_params)
    #   # set listable and listable_id
    #   @listing_club.save
    #   redirect_to supplier_club_listing_path(@supplier, @club, @listing_club)
    # else
    #   @listing_club_set = @club_set.listings.build(listing_params)
    #   # set listable and listable_id
    #   @listing_club_set.save
    #   redirect_to supplier_club_set_listing_path(@supplier, @club_set, @listing_club_set)
    # binding.pry
    @listing = Listing.create(listing_params)

    if @listing.save

      html_string = render_to_string 'listings/_listing', locals: {listing: @listing}, layout: false

      render json: {template: html_string}
    else
      flash[:notice] = 'Dates selected are not correct.'
      # redirect_to supplier_path(@supplier)
    end
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
