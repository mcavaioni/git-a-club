class PagesController < ApplicationController
  def welcome

  end

  def analytics
    @listings_under_5 = Listing.percent_under_five
    @uniq_club_ratio = Listing.uniq_club_ratio
    @uniq_club_set_ratio = Listing.uniq_club_set_ratio
  end

end
