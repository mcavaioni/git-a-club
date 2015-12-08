function changeToDate(array) {
  return array.map(function(element, index, array){
    var date = new Date(element)
    return (new Date(date.valueOf()+86400000)).toDateString();
    
  })
}

function attachCalendar() {
  var htmlDateArrays = $('.listing-availability');
  for(var i = 0; i < htmlDateArrays.length; i++) {
    var parsedDateArray = $(htmlDateArrays[i]).val().split(',');
    var dateArray = changeToDate(parsedDateArray);
    $($(".calendar")[i]).datepicker({
      beforeShowDay: function(date) {
        return [dateArray.indexOf(date.toDateString()) != -1];
      }
    });
    $('div.ui-datepicker').css('font-size', '85%')
  } 
}

function refreshCalendar(newCalendarData){
  $('.listing-availability').val(newCalendarData);
  $('div.ui-datepicker').remove();
  $('div.calendar').toggleClass('hasDatepicker').removeAttr('id');
  attachCalendar();
}