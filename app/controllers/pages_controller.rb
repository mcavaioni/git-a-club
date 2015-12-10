class PagesController < ApplicationController
  def welcome

  end

  def analytics
    @listings_under_5 = Listing.percent_under_five
    @uniq_club_ratio = Listing.uniq_club_ratio
    @uniq_club_set_ratio = Listing.uniq_club_set_ratio
    @average_price_active_club = Listing.average_price_active_club
    chart_data = AnalyticsChartViewObject.new(Listing.average_price_active_club_type)
    respond_to do |format|
      format.html
      format.json { render json: chart_data.make_data_hash}
    end
  end

end
