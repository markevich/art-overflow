@app = angular.module('Application', ['ngRoute', 'ngTurbolinks'])

@app.config([
  '$locationProvider'
  ($locationProvider) ->
    $locationProvider.html5Mode(true)
  ])

$(document).on 'page:before-change', ->
  angular.element('body').scope().$broadcast("$destroy")
