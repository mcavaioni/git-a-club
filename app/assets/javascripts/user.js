
$(function(){

  $('.btn-to-update').on ('click', function(){
    $('.user_form').show()
  })


$('.my_name').on('click', function(){
debugger;

})






$(".user_form").on ('ajax:success', function(event, data, status, xhr){
  

debugger;
  var template = $(data.template)
  // debugger;
  $(this).parents('.parent-js').find('.thisone').html($(template))

    // debugger;
  $('.user_form').on('dbclick', function(){
    $(this).parents('.thisone').addClass('displaying')

  })
})

  
})
