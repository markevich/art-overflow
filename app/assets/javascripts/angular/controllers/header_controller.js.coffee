@app.controller 'HeaderController',
  ['$scope','$document',  ($scope,$document) ->
      $scope.togglePopap = ->
        if $(".popup-header").is(":visible")
          $(".popup-header").hide()
        else
          $(".popup-header").show()

      $(document).click (event) ->
        if(!$(event.target).parent().hasClass('ava'))
          $(".popup-header").hide()

  ]
