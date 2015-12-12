class PagesController < ApplicationController
  def welcome

  end

  def analytics
    @listings_under_5 = Listing.percent_under_five
    @uniq_club_ratio = Listing.uniq_club_ratio
    @uniq_club_set_ratio = Listing.uniq_club_set_ratio
    @average_price_active_club = Listing.average_price_active_club
    avg_price_per_club = Listing.average_price_active_club_type
    chart_data = AnalyticsChartViewObject.new(avg_price_per_club.keys, avg_price_per_club.values)
    respond_to do |format|
      format.html
      format.json { render json: chart_data.make_data_hash}
    end
  end

end
