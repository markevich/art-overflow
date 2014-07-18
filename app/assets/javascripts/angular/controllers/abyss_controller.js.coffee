@app.controller 'AbyssController',
  ['$scope', '$location', '$timeout', 'ProjectsLoader', 'Filters', ($scope, $location, $timeout, ProjectsLoader, Filters) ->
    initialize = ->
      console.debug $scope.preloadedResources
      $scope.filters = new Filters($scope.preloadedResources)
      $scope.loader = new ProjectsLoader()
      $scope.loader.filters = $scope.filters.normalize()

    $scope.setOrderFilter = (key) ->
      $scope.filters.setOrder(key)
      applyFilters()

    applyFilters = ->
      $scope.loader.filters = $scope.filters.normalize()
      $scope.loader.reset()
      $scope.$broadcast('reseted')

    $timeout ->
      initialize()
  ]
