class ListingsController < ApplicationController
  # before_action :find_user, only: [:supplier_listings]
  # before_action :find_supplier, only: [:new, :create, :supplier_listings]
  # before_action :find_club, only: [:new, :create]
  # before_action :find_club_set, only: [:new, :create]

  def index
    @listings = Listing.all
  end

  def supplier_listings
    # binding.pry
    @listings = @supplier.listings
    render 'listings/index.html.erb'
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    
    # binding.pry
    # if request.xhr?
    @listing = Listing.create(listing_params) 
    # @listing.save

    html_string = render_to_string 'listings/_listing', locals: {listing: @listing}, layout: false

    render json: {template: html_string}

    # redirect_to @listing
    # end

  end

  private

  def listing_params
    params.require(:listing).permit(:start_date, :finish_date, :price, :listable_type, :listable_id)
  end

    # def find_user
    #   @listing = Listing.find_by(id: params[:id])
    # end

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