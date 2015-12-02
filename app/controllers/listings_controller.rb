class ListingsController < ApplicationController
  def index
     @listings = Listing.all
  end

  def user_listings
    @user = User.find_by(id: params[:id])
    @listings = @user.listings
  end
end