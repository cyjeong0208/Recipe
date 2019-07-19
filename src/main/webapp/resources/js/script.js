$(".sidebar ul a").on("click", function(event) {
  event.preventDefault();
  
  var $element = $(event.target),
      $target = $($element.attr("href")),
      elementOffsetTop = $target.offset().top,
      elementMarginTop = parseInt($target.css("margin-top")),
      headerHeight = $(".header").outerHeight();
  
  $('html, body').animate({
        scrollTop: elementOffsetTop - elementMarginTop - headerHeight
    }, 400);
});