@app.directive 'imagesReseted', ['$timeout', ($timeout) ->
  restrict: 'A'
  link: ($scope, $element, attrs) ->
    $scope.$on 'reseted', ->
      $element.find('img.picture').velocity 'transition.shrinkOut', 200
]
