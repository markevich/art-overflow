@app.controller 'projectEmotionsController',
  ['$scope', '$routeParams', 'Emotion', ($scope, $routeParams, Emotion) ->
    refresh = ->
      Emotion.query({projectId: $routeParams.id}).$promise.then (emotions) ->
        $scope.emotions = emotions

    refresh()
  ]
