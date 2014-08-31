@app.controller 'showProjectController',
  ['$scope', 'Project', '$routeParams', ($scope, Project, $routeParams) ->
    Project.get({id: $routeParams.id}).$promise.then (project) ->
      $scope.project = project

  ]
