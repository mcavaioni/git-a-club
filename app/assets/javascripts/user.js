$(document).on('page:load ready', function(){
  $.getJSON('/reservations/show_upcoming', function(data){
    var source = $('#reservations-template').html();
    var template = Handlebars.compile(source);
    var reservations_html = template(data);
    $('#upcoming-reservations').append(reservations_html);
    reservationDetails();
  });
})

$(document).on('page:load ready', function(){
  $('.upcoming-reservations').on('ajax:success', function(event, data, status, xhr){
    $('#show-details').children().remove();
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
    $('#show-details').children().remove();
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
    $('#show-details').children().remove();
    var source = $('#reservation-details-template').html();
    var template = Handlebars.compile(source);
    var reservation_details_html = template(data);
    $('#show-details').append(reservation_details_html);
  })
}
  
$(document).on('page:load ready', function(){
  $('.club-listings').on('ajax:success', function(event, data, status, xhr){
    $('#show-details').children().remove();
    $('#club-listings').children().remove();
    var source = $('#listings-template').html();
    var template = Handlebars.compile(source);
    var reservations_html = template(data);
    $('#club-listings').append(reservations_html);
    listingDetails();
  });
})

$(document).on('page:load ready', function(){
  $('.club-set-listings').on('ajax:success', function(event, data, status, xhr){
    $('#show-details').children().remove();
    $('#club-set-listings').children().remove();
    var source = $('#listings-template').html();
    var template = Handlebars.compile(source);
    var reservations_html = template(data);
    $('#club-set-listings').append(reservations_html);
    listingDetails();
  });
})

function listingDetails(){
  $('.listing-details-link').on('ajax:success', function(event, data, status, xhr){
    $('#show-details').children().remove();
    var source = $('#listing-details-template').html();
    var template = Handlebars.compile(source);
    var reservation_details_html = template(data);
    $('#show-details').append(reservation_details_html);
  })
}

$(document).on('page:load ready', function(){
  $('.clubs-index').on('ajax:success', function(event, data, status, xhr){
    $('#show-details').children().remove();
    $('#clubs-index').children().remove();
    var source = $('#clubs-template').html();
    var template = Handlebars.compile(source);
    var clubs_html = template(data);
    $('#clubs-index').append(clubs_html);
    clubDetails();
  });
})

function clubDetails(){
  $('.club-details-link').on('ajax:success', function(event, data, status, xhr){
    $('#show-details').children().remove();
    var source = $('#club-details-template').html();
    var template = Handlebars.compile(source);
    var club_details_html = template(data.obj.clubs[0]);
    $('#show-details').append(club_details_html);
    $('#details').append($.parseHTML(data.form));
    listingForm();
  });
}

function listingForm(){
  $('#new_listing').on('ajax:success', function(event, data, status, xhr){
    $('#listing-form-notice').removeClass();
    $('#listing-form-notice').empty();
    if(data.errors == undefined){
      $('#listing-form-notice').toggleClass('alert alert-dismissible alert-success');
      $('#listing-form-notice').text(data.success)
    } else {
      $('#listing-form-notice').toggleClass('alert alert-dismissible alert-danger');
      $('#listing-form-notice').text(data.errors)
    }
  });
}