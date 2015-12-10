$(document).on('page:load ready',function(){
  $.getJSON('/pages/analytics', function(data){
    debugger;
    var listings = data;
    $('.search-results').html('')
    var listing_results = ""
    listings.forEach(function(listing){
      var listing_html = template(listing);
      listing_results = listing_results + listing_html
    });
  });

  var data, myNewChart;
  data = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
      {
        fillColor: "rgba(220,220,220,0.5)",
        strokeColor: "rgba(220,220,220,1)",
        pointColor: "rgba(220,220,220,1)",
        pointStrokeColor: "#fff",
        data: [65, 59, 90, 81, 56, 55, 40]
      }, {
        fillColor: "rgba(151,187,205,0.5)",
        strokeColor: "rgba(151,187,205,1)",
        pointColor: "rgba(151,187,205,1)",
        pointStrokeColor: "#fff",
        data: [28, 48, 40, 19, 96, 27, 100]
      }
    ]
  };
  return myNewChart = new Chart($("#canvas").get(0).getContext("2d")).Line(data);
});
