@app.controller 'AbyssController',
  ['$scope', '$location', '$timeout', 'ProjectsLoader', 'Filters', ($scope, $location, $timeout, ProjectsLoader, Filters) ->
    initialize = ->
      $scope.filters = new Filters($scope.preloadedResources)
      $scope.loader = new ProjectsLoader()
      $scope.loader.filters = $scope.filters.normalize()

    $scope.setOrderFilter = (key) ->
      $scope.filters.setOrder(key)
      $scope.applyFilters()

    $scope.applyFilters = ->
      $scope.loader.filters = $scope.filters.normalize()
      $scope.loader.reset()
      $scope.$broadcast('reseted')

    $timeout ->
      initialize()
  ]
