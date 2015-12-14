class PagesController < ApplicationController
  def welcome

  end

  def test_data
    data = ListingsHeatMapServiceObject.build_hash
    render json: data
  end

  def analytics
    @listings_under_5 = Listing.percent_under_five
    @uniq_club_ratio = Listing.uniq_club_ratio
    @uniq_club_set_ratio = Listing.uniq_club_set_ratio
    @average_price_active_club = Listing.average_price_active_club
    avg_price_per_club = Listing.average_price_active_club_type
    chart_data = {avg_club_price: AnalyticsChartViewObject.new(avg_price_per_club.keys, avg_price_per_club.values).make_data_hash}
    clubs_set_size = ClubSet.club_sets_by_size
    chart_data[:clubs_set_size] = AnalyticsChartViewObject.new(clubs_set_size.keys, clubs_set_size.values).make_data_hash
    respond_to do |format|
      format.html
      format.json { render json: chart_data}
    end
  end

end
