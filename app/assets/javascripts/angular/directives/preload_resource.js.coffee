@app.directive 'preloadResource', ->
  link: ($scope, $element, attrs) ->
    $scope.preloadedResources ||= {}
    $scope.preloadedResources[attrs.resourceKey] = JSON.parse(attrs.preloadResource)

    $element.remove()
