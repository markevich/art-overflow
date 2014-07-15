@app.controller 'AbyssController',
  ['$scope', '$location', '$timeout', 'ProjectsLoader', ($scope, $location, $timeout, ProjectsLoader) ->
    $scope.loader = new ProjectsLoader()
    $scope.options = {}

    $scope.setOrderFilter = (type) ->
      $scope.loader.reset()
      $scope.$broadcast('reseted')
  ]
