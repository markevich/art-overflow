@app.directive 'fixedOnTop', ->
  restrict: 'A'
  link: ($scope, $element, $attrs) ->
    positionElement = $element.offset().top
    arrow = $attrs['arrow']
    name = $attrs['name']
    $(window).scroll ->
      windowPosition = $(window).scrollTop()
      if (positionElement < windowPosition)
        $element.addClass('fixed')
        $(".#{arrow}").show()
      else
        $element.removeClass('fixed')
        $(".#{arrow}").hide()

      $(".#{arrow}").on "click.#{name}", ->
        $("html, body").animate
          scrollTop: 0
        , 300

    $scope.$on '$destory', ->
      $(".#{arrow}").off "click.#{name}"
