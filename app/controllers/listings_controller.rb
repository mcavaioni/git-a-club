class ListingsController < ApplicationController
  # before_action :find_user, only: [:supplier_listings]
  before_action :find_supplier, only: [:new, :create, :supplier_listings]
  before_action :find_club, only: [:new, :create]
  before_action :find_club_set, only: [:new, :create]

  def index
    @listings = Listing.all
  end

  def supplier_listings
    @listings = @supplier.listings
    render 'listings/index.html.erb'
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
    # binding.pry
  end

  def create
    if @club
      @listing_club = @club.listings.build(listing_params)
      @listing_club.save
      redirect_to supplier_club_listing_path(@supplier, @club, @listing_club)
    else
      @listing_club_set = @club_set.listings.build(listing_params)
      @listing_club_set.save
      redirect_to supplier_club_set_listing_path(@supplier, @club_set, @listing_club_set)
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:start_date, :finish_date, :price)
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