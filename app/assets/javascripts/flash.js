$(function(){
  $('form').on('ajax:success', function(event, data, status, xhr) {
    $('#flash-notice').text(data.notice);
  });
})