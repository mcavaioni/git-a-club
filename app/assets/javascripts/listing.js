$(document).on('page:load ready',function(){

  $('.create_form_btn').on ('click', function(){
    var $form = $(this).parent().find('#new-listing-form')
    $form.toggleClass("hide-form")
    $(this).toggleClass("hide-button")
  });

  $('.btn-cancel').on ('click', function(){
    var $form = $(this).parent()
    $form.toggleClass("hide-form")
    var $listing_btn = $(this).parent().parent().find('.create_form_btn')
    $listing_btn.toggleClass("hide-button")
  });

  $('form > .cancel-listing').parent().on('ajax:success', function(event, data, status, xhr){
    if (data.errors == null) {
      $(this).parent().parent().remove();
      $('#flash-notice').text('Listing Removed');
    } else {
      // $('#flash-notice').text(data.errors[0]);
      // $('#flash-notice').text('Sorry! You cannot cancel a reservation less than 7 days prior.');
      // Add error message after validation
    }
  });

})
