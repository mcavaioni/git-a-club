$(function(){
$('.my_name').on('click', function(){
  var elem = $('.my_id').val()
  html_form = "<form class='my_form' data-remote='true' action='/users/"+elem+"' method='post'> <input type='hidden' name='_method' value='patch'>First-name<input type='text' name='user[first_name]'></input>Last-name<input type='text' name='user[last_name]'></input>Address:<input type='text' name='user[address]'></input>Phone-number<input type='text' name='user[phone_number]'></input>Password:<input type='password' name='user[password]'></input><input type='submit' value='submit'></input></form>"
  dom_element = $(html_form)
  $(this).replaceWith(dom_element)
  })

$("body").on('ajax:success', ".my_form", function(json, data){
 
  $(".high-div").append($(data.template));

  $(".my_form").addClass("user_form")
})
})

$(document).on('page:load ready', function(){
  $('.upcoming-reservations').on('ajax:success', function(event, data, status, xhr){
    $('#show-reservation-details').children().remove();
    $('#upcoming-reservations').children().remove();
    var source = $('#reservations-template').html();
    var template = Handlebars.compile(source);
    var reservations_html = template(data);
    $('#upcoming-reservations').append(reservations_html);
    reservationDetails();
  });
})

$(document).on('page:load ready', function(){
  $('.past-reservations').on('ajax:success', function(event, data, status, xhr){
    $('#show-reservation-details').children().remove();
    $('#past-reservations').children().remove();
    var source = $('#reservations-template').html();
    var template = Handlebars.compile(source);
    var reservations_html = template(data);
    $('#past-reservations').append(reservations_html);
    reservationDetails();
  });
})

function reservationDetails(){
  $('.reservation-details-link').on('ajax:success', function(event, data, status, xhr){
    $('#show-reservation-details').children().remove();
    var source = $('#reservation-details-template').html();
    var template = Handlebars.compile(source);
    var reservation_details_html = template(data);
    $('#show-reservation-details').append(reservation_details_html);
  })
}
  


