$(document).on('page:load ready', function(){
  $('form > .cancel-reservation').parent().on('ajax:success', function(event, data, status, xhr){
    if (data.errors == null) {
      $(this).parent().parent().remove();
      $('#flash-notice').text('Reservation Canceled');
    } else {
      // $('#flash-notice').text(data.errors[0]);
      $('#flash-notice').text('Sorry! You cannot cancel a reservation less than 7 days prior.');
    }
  });
});