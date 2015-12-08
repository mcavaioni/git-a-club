$(function(){

  $("form#listings-search").on('ajax:success', function(event, data, status, xhr){
    var source = $('#entry-template').html();
    var template = Handlebars.compile(source);
    var listings = data;
    $('.search-results').html('')
    var listing_results = ""
    listings.forEach(function(listing){
      var listing_html = template(listing);
      listing_results = listing_results + listing_html
    })
    $(listing_results).wrap("<ul></ul>").appendTo('.search-results')
    // load results
    // apply checkbox criteria
  })
})


  // $('#new_product').on('ajax:success', function(event, data, status, xhr){
  //   $(this).find('input:text').val('');
  //   var template = $(data.template)
  //   $('.container').append(template);
  // })
