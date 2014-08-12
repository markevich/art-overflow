@app.directive 'fixedOnTop', ->
  restrict: 'A'
  link: ($scope, $element, $attrs) ->
    positionElement = $element.offset().top
    arrow = $attrs['arrow']
    name = $attrs['name']

    isFixed = ->
      windowPosition = $(window).scrollTop()

      positionElement < windowPosition

    $(window).scroll =>
      if isFixed()
        $element.addClass('fixed')
        $(".#{arrow}").show()
      else
        $element.removeClass('fixed')
        $(".#{arrow}").hide()

    $(".#{arrow}").on "click.#{name}", ->
      $(".header").velocity 'scroll', 300

    $scope.$on '$destory', ->
      $(".#{arrow}").off "click.#{name}"

    $scope.$on 'reseted', ->
      if isFixed()
        window.scrollTo(0, positionElement);
