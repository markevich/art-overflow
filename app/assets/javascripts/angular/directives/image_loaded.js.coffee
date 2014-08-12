@app.directive 'imageLoaded', ['$timeout', ($timeout) ->
  restrict: 'AC'
  link: (scope, element, attrs) ->
    $timeout ->
      imagesLoaded element, ->
        element.velocity 'fadeIn', 300, =>
          element.removeClass 'loading'
]
