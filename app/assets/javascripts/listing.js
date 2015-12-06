$(function(){
  $('.button-class').on ('click', function(){
    var $form = $(this).first().siblings()
    $form.toggleClass("hide-form")
    $(this).toggleClass("hide-button")

  })
  
//   $('.btn-cancel').on ('click', function(){

//     var $form = $(this).parent()
//     $form.toggleClass("hide-form")
//     var $button = $form.siblings()
//     $button.toggleClass("hide-button")
//   })
})

$(function (){
  $(".new_listing").on ('ajax:success', function(event, data, status, xhr){
    // debugger;
    var template = $(data.template);
    $(this).parent().append(template);
  })
})
