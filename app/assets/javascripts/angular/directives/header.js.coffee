@app.directive 'popup', ->
  restrict: 'A'
  link: ($scope, $element, $attrs) ->
    trigger = $attrs['trigger']
    name = $attrs['name']
    $(".#{trigger}").on "click.#{name}", ->
      $element.toggle()

    $(document).on "click.#{name}", (event) ->
      if(!$(event.target).hasClass(trigger))
        $element.hide()

    $scope.$on '$destory', ->
      $(".#{trigger}").off "click.#{name}",
      $(document).off "click.#{name}"
