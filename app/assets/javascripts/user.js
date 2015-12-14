$(document).on('page:load ready', function(){
  $('.upcoming-reservations').on('ajax:success', function(event, data, status, xhr){
    $('#show-details').children().remove();
    $('#upcoming-reservations').children().remove();
    var source = $('#reservations-template').html();
    var template = Handlebars.compile(source);
    var reservations_html = template(data);
    $('#upcoming-reservations').append(reservations_html);
    reservationDetails();
    cancelHandler();
    clearFlash();
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
    debugger;
    // $('#show-details').children().remove();
    // var source = $('#listing-details-template').html();
    // var template = Handlebars.compile(source);
    // var reservation_details_html = template(data);
    // $('#show-details').append(reservation_details_html);
  });
}

function clearFlash(){
  $('a:not(.user-page-cancel)').on('click', function(event, data, status, xhr){
    $('.text-warning').text('');
    cancelHandler();
  });
}

function cancelHandler(){
  $('a.user-page-cancel').on('ajax:success', function(event, data, status, xhr){
      debugger;
    if (data.errors == null) {
      // figure out how to remove 'this'
      // do nothing yet
    }else{
      var error = data.errors[0];
      $('.text-warning').text(error);
      debugger;
    }
  });
}
