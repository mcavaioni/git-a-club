$(document).on('page:load ready',function(){
  var url = this.URL.split('/')
  var length = this.URL.length
  var analytics = url[length-1]
  if (analytics == "analytics"){
    $.getJSON('/pages/analytics', function(data){
        var data, myNewChart;
        return myNewChart = new Chart($("#canvas").get(0).getContext("2d")).Bar(data);
    });
  }
});
