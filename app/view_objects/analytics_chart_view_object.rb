class AnalyticsChartViewObject

  attr_accessor :average_price_active_club_type

  def initialize(average_price_active_club_type)
    @average_price_active_club_type = average_price_active_club_type
  end

  def get_club_types
    average_price_active_club_type.keys
  end

  def data_set_array
    average_price_active_club_type.values
  end

  def make_data_hash
    # club_types = get_club_types
    # data_set = data_set_array
    {
    labels: get_club_types,
    datasets: [
      {
        fillColor: "rgba(220,220,220,0.5)",
        strokeColor: "rgba(220,220,220,1)",
        pointColor: "rgba(220,220,220,1)",
        pointStrokeColor: "#fff",
        data: data_set_array
      }
    ]
    }
  end

end
