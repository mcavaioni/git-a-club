$(document).on('page:load ready',function(){
  $.getJSON('/pages/analytics', function(data){
    var data, myNewChart;
    // data.title = {text: "This is the title"};
    // options = {scaleLabel: "CHART TITLE",}
    // data.title.text = "Axis Y labels with Formatted Numbers"
    // var options = {title: {
    //     text: "Axis Y labels with Formatted Numbers"
    //     }
        // axisY:{
        //   title: 'Avergae Price Per Club',
        //   valueFormatString:  "#,##0.##",
        //   prefix: "$"
        // }
    // }
    return myNewChart = new Chart($("#canvas").get(0).getContext("2d")).Bar(data);
    });
  });
