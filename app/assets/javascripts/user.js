
$(function(){


$('.my_name').on('click', function(){
  var elem = $('.my_id').val()
  html_form = "<form class='my_form' data-remote='true' action='/users/"+elem+"' method='post'> <input type='hidden' name='_method' value='patch'>First-name<input type='text' name='user[first_name]'></input>Last-name<input type='text' name='user[last_name]'></input>Address:<input type='text' name='user[address]'></input>Phone-number<input type='text' name='user[phone_number]'></input>Password:<input type='password' name='user[password]'></input><input type='submit' value='submit'></input></form>"
  dom_element = $(html_form)
  $(this).replaceWith(dom_element)
  })

$("body").on('ajax:success', ".my_form", function(json, data){
 
  $(".high-div").append($(data.template));

  $(".my_form").addClass("user_form")

})

})


  

