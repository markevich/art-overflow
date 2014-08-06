@app.directive 'popup', ->
  restrict: 'A'
  link: ($scope, $element, $attrs) ->
    console.log($(".#{$attrs['trigger']}"))
    $(".#{$attrs['trigger']}").on 'click', ->
      $element.toggle()

    $(document).on 'click', (event) ->
      if(!$(event.target).hasClass($attrs['trigger']))
        $element.hide()
