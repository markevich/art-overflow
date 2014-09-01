@app.controller 'projectEmotionsController',
  ['$scope', '$routeParams', 'Emotion', 'currentUser', ($scope, $routeParams, Emotion, currentUser) ->
    refresh = ->
      Emotion.query({project_id: $routeParams.id}).$promise.then (emotions) ->
        emotionGroups = {}
        angular.forEach $scope.preloadedResources.emotionTypes, (type) ->
          emotionGroups[type] = []
        $scope.emotions = emotions
        angular.forEach emotions, (emotion) ->
          emotionGroups[emotion.type].push(emotion)

        $scope.emotionGroups = emotionGroups
        $scope.$broadcast('emotionsUpdated')

    $scope.addEmotion = (type) ->
      new Emotion(project_id: $routeParams.id, user_id: currentUser.id, type: type).$save()
      refresh()

    refresh()
  ]
