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

    $scope.disableEdit = ->
      this.displayEffect = false;

    $scope.enableEdit = ->
      this.displayEffect = true;

    $timeout ->
      initialize()
  ]
