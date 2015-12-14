class PagesController < ApplicationController
  def welcome

  end

  def test_data
    # render 'pages/dji'
    # {'2015-12-15' => 10, '2015-12-16' => 25, '2015-12-17' => 3, '2015-12-18' => 40, '2015-12-19' => 65}
    data = {'2010-10-01' => 0.0037035252073270622, '2010-09-30' => -0.0044213895215559915, '2010-09-29' => -0.002090628275240782, '2010-09-28' => 0.004467222024357327, '2010-09-27' => -0.00441895648538722}
    binding.pry
    redner json: data
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
