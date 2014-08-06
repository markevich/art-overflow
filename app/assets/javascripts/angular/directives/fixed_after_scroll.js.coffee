@app.directive 'fixedOnTop', ->
  restrict: 'A'
  link: ($scope, $element, $attrs) ->
    positionElement = $element.offset().top
    $(window).scroll ->
      windowPosition = $(window).scrollTop()
      if (positionElement < windowPosition)
        $element.addClass('fixed')
      else
        $element.removeClass('fixed')
