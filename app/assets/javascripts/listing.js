$(function(){
  $.get('/listings/four_listings/0', function(data){
    $('.search-results').append(data.new_row);
    attachCalendar();
  })

  $('.load-listings').on('click', function(){
    row_number = $('.search-results .row').length;
    $.get('/listings/four_listings/'+row_number*4, function(data){
      $('.search-results').append(data.new_row);
      attachCalendar();
    })
  })

  $('.create_form_btn').on ('click', function(){
    var $form = $(this).first().siblings()
    $form.toggleClass("hide-form")
    $(this).toggleClass("hide-button")
  })

  $('.btn-cancel').on ('click', function(){
    // debugger;
    var $form = $(this).parent()
    $form.toggleClass("hide-form")
    var $listing_btn = $(this).parent().siblings().first()
    $listing_btn.toggleClass("hide-button")
  })

})

$(function (){
  $(".new_listing").on ('ajax:success', function(event, data, status, xhr){
    // debugger;
    var template = $(data.template);
    $(this).parent().append(template);
  })
})
