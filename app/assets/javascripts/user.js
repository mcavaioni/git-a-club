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
    $('#new_club_container').remove();
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

// $(document).on('page:change', function(){
//   debugger;
//   cancelHandler();
//   clearFlash();
// })


$(document).on('page:load ready', function(){
  $('.past-reservations').on('ajax:success', function(event, data, status, xhr){
    $('#new_club_container').remove();
    $('#show-details').children().remove();
    $('#past-reservations').children().remove();
    var source = $('#reservations-template').html();
    var template = Handlebars.compile(source);
    var reservations_html = template(data);
    $('#past-reservations').append(reservations_html);
    reservationDetails();
    cancelHandler();
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
    $('#new_club_container').remove();
    $('#show-details').children().remove();
    $('#club-listings').children().remove();
    var source = $('#listings-template').html();
    var template = Handlebars.compile(source);
    var reservations_html = template(data);
    $('#club-listings').append(reservations_html);
    listingDetails();
    cancelHandler();
  });
})

$(document).on('page:load ready', function(){
  $('.club-set-listings').on('ajax:success', function(event, data, status, xhr){
    $('#new_club_container').remove();
    $('#show-details').children().remove();
    $('#club-set-listings').children().remove();
    var source = $('#listings-template').html();
    var template = Handlebars.compile(source);
    var reservations_html = template(data);
    $('#club-set-listings').append(reservations_html);
    listingDetails();
    cancelHandler();
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
    $('#new_club_container').remove();
    $('#show-details').children().remove();
    $('#clubs-index').children().remove();
    var source = $('#clubs-template').html();
    var template = Handlebars.compile(source);
    var clubs_html = template(data.table);
    $('#clubs-index').append(clubs_html);
    clubDetails();
    $('.profile').append($.parseHTML(data.form));
    // $('#club-table-body').prepend($.parseHTML(data.form));
    clubForm();
    cancelHandler();
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

$(document).on('page:load ready', function(){
  $('.sets-index').on('ajax:success', function(event, data, status, xhr){
    // debugger;
    $('#new_club_container').remove();
    $('#show-details').children().remove();
    $('#sets-index').children().remove();
    var source = $('#club_sets-template').html();
    var template = Handlebars.compile(source);
    var club_sets_html = template(data.table);
    $('#sets-index').append(club_sets_html);
    cancelHandler();
  });
})





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

function clubForm(){
  $('#new_club').on('ajax:success', function(event, data, status, xhr){
    $('#club-form-notice').removeClass();
    $('#club-form-notice').empty();
    if(data.errors == undefined){
      $('#club-form-notice').toggleClass('alert alert-dismissible alert-success');
      $('#club-form-notice').text(data.success)
    } else {
      $('#club-form-notice').toggleClass('alert alert-dismissible alert-danger');
      $('#club-form-notice').text(data.errors)
    }
  });
}


function clearFlash(){
  $('a:not(.user-page-cancel)').on('click', function(event, data, status, xhr){
    $('.text-warning').text('');
  });
}

function cancelHandler(){
  $('a.user-page-cancel').on('ajax:success', function(event, data, status, xhr){
    if (data.errors == null) {
      $(this).parent().parent().remove()
    }else{
      var error = data.errors[0];
      $('.text-warning').text(error);
    }
  });
}
