function parseDateArray(dateArray) {
  var filteredDateArray = dateArray.split(', ').filter(function(element, index, array){
    return element.match(/\d.*/) != null
  });
  return removeBracket(filteredDateArray)
}

function removeBracket(array) {
  return array.map(function(element, index, array){
    return element.replace(']', '');
  });
}

function changeToDate(array) {
  return array.map(function(element, index, array){
    return (new Date(element)).toString();
  })
}

function attachCalendar() {
  var htmlDateArrays = $('.listing-availability');
  for(var i = 0; i < htmlDateArrays.length; i++) {
    var parsedDateArray = parseDateArray($(htmlDateArrays[i]).val());
    var dateArray = changeToDate(parsedDateArray);
    $($(".calendar")[i]).datepicker({
      beforeShowDay: function(date) {
        return [dateArray.indexOf(date.toString()) != -1];
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
// $(function(){
//   var htmlDateArrays = $('.listing-availability');
//   debugger;
//   for(var i = 0; i < htmlDateArrays.length; i++) {
//     debugger;
//     var parsedDateArray = parseDateArray(htmlDateArrays[i].val());
//     var dateArray = changeToDate(parsedDateArray);
//     $( "#calander" ).datepicker({
//       beforeShowDay: function(date) {
//         return [dateArray.indexOf(date.toString()) != -1];
//       }
//     }); 
//   }
// })