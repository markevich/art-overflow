@app.directive 'popup', ->
  restrict: 'A'

  link: ($scope, $element, $attrs) ->
    trigger = $attrs['trigger']
    name = $attrs['name']
    excludeItems = JSON.parse($attrs.exclude)

    $(".#{trigger}").on "click.#{name}", ->
      $element.toggle()

    $(document).on "click.#{name}", (event) ->
      $target = $(event.target)

      console.debug $target
      needHide = true

      angular.forEach excludeItems, (item) =>
        needHide = false if $target.hasClass(item)

      $element.hide() if needHide

    $scope.$on '$destory', ->
      $(".#{trigger}").off "click.#{name}",
      $(document).off "click.#{name}"
