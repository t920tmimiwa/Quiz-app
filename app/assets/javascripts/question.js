/*global $*/
/*global $alert*/

$(function() {
  // limits the number of categories
  $('.mt-2').on('click', function() {
    if ($('.nested-fields').length == 9) {
      $(".mt-2").hide();
    } if ($('.nested-fields').length >= 2) {
      $('.w-auto').show();
    }
  });
  
  $('.w-auto').on('click', function() {
    if ($('.nested-fields').length <= 3) {
      $(".w-auto").hide();
      console.log($('.nested-fields').length)
    } if ($('.nested-fields').length != 9) {
      $('.mt-2').show();
    }
  });
  
});


