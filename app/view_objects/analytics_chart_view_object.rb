class AnalyticsChartViewObject

  attr_accessor :labels, :data

  def initialize(labels, data)
    @labels = labels
    @data = data
  end

  def make_data_hash
    {
    labels: labels,
    datasets: [
      {
        fillColor: "rgba(220,220,220,0.5)",
        strokeColor: "rgba(220,220,220,1)",
        pointColor: "rgba(220,220,220,1)",
        pointStrokeColor: "#fff",
        data: data
      }
    ]
    }
  end

end
