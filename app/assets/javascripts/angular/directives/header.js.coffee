@app.directive 'popup', ->
  restrict: 'A'
  link: ($scope, $element) ->
    $element.parent().find('.ava').on 'click', ->
      if $element.is(":visible")
        $element.hide()
      else
        $element.show()
    $(document).bind 'click', (event) ->
      if(!$(event.target).parent().hasClass('ava'))
        $element.hide()
