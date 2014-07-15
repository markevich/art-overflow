@app.directive 'resizable', ['$window', '$sce', ($window, $sce) ->
  restric: 'A'
  link: ($scope, $element, $attrs) ->
    $scope.$on 'window-resized', ->
      fallbackWidth = $('.picture-container')[0].getBoundingClientRect().width

      $scope.options.fallbackImageStyleHack = $sce.trustAsHtml "
        <style>
          .image-block > a{
            width:  #{fallbackWidth}px;
            height: #{fallbackWidth}px;
          }
        </style>
      "

    $scope.$broadcast('window-resized')

    $($window).on 'resize', ->
      $scope.$broadcast('window-resized')
      $scope.$apply()

    $scope.$on '$destroy', ->
      $($window).off 'resize'
]
