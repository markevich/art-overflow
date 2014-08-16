@app.directive 'hover-effects', ->
  restrict: 'A'

  link: ($scope) ->

    $scope.disableEdit = (item) ->
      item.displayEffect = false;

    $scope.enableEdit = (item) ->
      item.displayEffect = true;
