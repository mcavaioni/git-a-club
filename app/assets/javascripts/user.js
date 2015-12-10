
$(function(){

  $('.btn-to-update').on ('click', function(){
    $('.user_form').show()
  })

$("form.edit_user").on ('ajax:success', function(event, data, status, xhr){
  

  var template = $(data.template)
  // debugger;
  $(this).parents('.parent-js').find('.thisone').html($(template))

    // debugger;
  $('.user_form').on('dbclick', function(){
    $(this).parents('.thisone').addClass('displaying')

  })
})

  
})
