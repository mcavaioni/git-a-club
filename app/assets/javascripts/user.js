
$(function(){

  // $('.btn-to-update').on ('click', function(){
  //   $('.user_form').show()
  // })


$('.my_name').on('click', function(){
  var elem = $('.my_id').val()
  html_form = "<form class='my_form' data-remote='true' action='/users/"+elem+"' method='post'> <input type='hidden' name='_method' value='patch'>First-name<input type='text' name='user[first_name]'></input>Last-name<input type='text' name='user[last_name]'></input>Address:<input type='text' name='user[address]'></input>Phone-number<input type='text' name='user[phone_number]'></input>Password:<input type='password' name='user[password]'></input><input type='submit' value='submit'></input></form>"
  dom_element = $(html_form)
  $(this).replaceWith(dom_element)
  })

$("body").on('ajax:success', ".my_form", function(json, data){
 
  $(".high-div").append($(data.template));

  $(".my_form").addClass("user_form")


// $('.my_name').on('submit', function(e){
//     e.preventDefault();
//     debugger;

})

})

// $(function(){
//   $(".my_name").on("submit", function(e){
//     e.preventDefault();
//     debugger;
    // var $form = $(this);

    // // What needs to happen?
    // // Send the info to the create method.
    
    // // we need the form data
    // var data = $form.serialize();
    // var url = $form.attr("action");

    // var method_input = $("input[name=_method]", $form)[0];
    
    // if (method_input){
    //   var method = $(method_input).attr("value")
    // } else {
    //   var method = $form.attr("method")  
    // }


    // $.ajax({
    //   data: data,
    //   url: url,
    //   method: method,
    //   dataType: "script"
    // });



// $(".user_form").on ('ajax:success', function(event, data, status, xhr){
  

// debugger;
//   var template = $(data.template)
//   // debugger;
//   $(this).parents('.parent-js').find('.thisone').html($(template))

//     // debugger;
//   $('.user_form').on('dbclick', function(){
//     $(this).parents('.thisone').addClass('displaying')

//   })
// })

  

