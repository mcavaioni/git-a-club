class ListingsController < ApplicationController
  before_action :find_user, only: [:user_listings, :show]
  def index
     @listings = Listing.all
  end

  def user_listings
    @listings = @user.listings
  end

  def show
    
  end

  private

  def find_user
    @listing = Listing.find_by(id: params[:id])
  end
end