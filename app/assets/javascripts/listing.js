$(function(){

  $.get('/listings/four_listings/0', function(data){
    $('.search-results').append(data.new_row)
  })

  $('.load-listings').on('click', function(){
    row_number = $('.search-results .row').length;
    debugger;
    $.get('/listings/four_listings/'+row_number*4, function(data){
      $('.search-results').append(data.new_row);
    })
  })

  $('.button-class').on ('click', function(){
    var $form = $(this).first().siblings()
    $form.toggleClass("hide-form")
    $(this).toggleClass("hide-button")

  })

  $('.btn-cancel').on ('click', function(){

    var $form = $(this).parent()
    $form.toggleClass("hide-form")
    var $button = $form.siblings()
    $button.toggleClass("hide-button")
  })
})
