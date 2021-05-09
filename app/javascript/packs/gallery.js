import $ from "jquery";
import Masonry from "masonry-layout"

$(document).on("turbolinks:load", function() {
  var grid = document.querySelector('.grid');
  var msnry = new Masonry(grid, {
    itemSelector: '.grid-item',
  });

  $(document).on("click", ".grid-item", function(e) {
    if (!$(this).hasClass('item-opened')) {
      var elWidth = $(this).outerWidth() / 2;
      var elPosition = this.getBoundingClientRect();

      $(this).attr('data-coord-left', $(this).css('left'));
      $(this).attr('data-coord-top', $(this).css('top'));

      $(this).css({
        top: elPosition.top,
        left: elPosition.left
      }).delay(400).css({
        top: '4%',
        left: '15%',
        zIndex: '99999',
      }).addClass('item-opened');

      $('.grid-alpha').fadeIn();

      $('html, body').animate({
        scrollTop: $('.grid').offset().top
      }, 650);
      $('.grid').css('overflow', 'visible');
    } else{
      $('.grid').css('overflow', 'hidden');
    }
  });

  $(document).on('click', function(e) {
    if ($('.item-opened').length > 0) {
      if (!$(e.target).closest('.grid-item').length && !$(e.target).hasClass('item-opened')) {
        $('.grid-alpha').fadeOut(650);

        $('.item-opened').css({
          top: $('.item-opened').data('coord-top'),
          left: $('.item-opened').data('coord-left'),
          marginLeft: ''
        });

        $('html, body').animate({
          scrollTop: ($('.grid').offset().top + parseFloat($('.item-opened').data('coord-top'))) - 30
        }, 650);

        setTimeout(function() {
          $('.grid-item').css('z-index', '').removeClass('item-opened');
        }, 350);
        $('.grid').css('overflow', 'hidden');
      }
    }
  });
})
