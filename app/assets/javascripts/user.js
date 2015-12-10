
$(function(){

$("form.edit_user").on ('ajax:success', function(event, data, status, xhr){
  
  var template = $(data.template)
  debugger;
  $(this).parents('.parent-js').find('.thisone').html($(template))

    debugger;
  $('.thisone').on('dbclick', function (){
    $(this).parents('.thisone').addClass('displaying')

  })
})

  
})
