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

    $scope.togglePopap = ->
      if $(".popup-categories").is(":visible")
        $(".popup-categories").hide()
      else
        $(".popup-categories").show()

    $(document).click (event) ->
      if(!$(event.target).parent().hasClass('active'))
        $(".popup-categories").hide()

    $timeout ->
      initialize()
  ]
