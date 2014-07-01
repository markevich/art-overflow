@app.controller("categoriesController",[
    '$scope'
    '$element'
    ($scope, $element) ->
      $scope.value = ''
      
      $scope.setCategories = ->
        checkboxes = $element.find('.js-category-checkbox:checked')
        values = []
        for checkbox in checkboxes
          values.push(checkbox.value)
        $scope.value = values.join(',')
  ])