@app.controller 'HeaderController',
  ['$scope',  ($scope) ->
      $scope.show = true
      $scope.togglePopap = ->
        $scope.show = (if $scope.show is false then true else false)
        return
  ]

