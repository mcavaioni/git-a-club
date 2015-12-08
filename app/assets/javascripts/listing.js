$(document).on('page:load ready',function(){
  // $.get('/listings/four_listings/0', function(data){
  //   $('.search-results').append(data.new_row);
  //   attachCalendar();
  // })
  // Remove once search is implemented ^^

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
    var $form = $(this).parent()
    $form.toggleClass("hide-form")
    var $listing_btn = $(this).parent().siblings().first()
    $listing_btn.toggleClass("hide-button")
  })
  
  $(".appending_listing").on ('ajax:success', function(event, data, status, xhr){
    var template = $(data.template);
    $(this).parent().append(template);
  })
})
