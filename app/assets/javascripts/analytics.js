$(document).on('page:load ready',function(){
  if (isAnalyticsPage(this)){
    $.getJSON('/pages/analytics', function(data){
        makeChart('#avgClubPrice', data.avg_club_price);
        makeChart('#clubSetSize', data.clubs_set_size);
    });
  }
});

function isAnalyticsPage(self){
  var url = self.URL.split('/')
  var length = url.length
  var analytics = url[length-1]
  return (analytics == "analytics")
}

function makeChart(chartID, chartData){
  var myNewChart;
  return myNewChart = new Chart($(chartID).get(0).getContext("2d")).Bar(chartData);
}
