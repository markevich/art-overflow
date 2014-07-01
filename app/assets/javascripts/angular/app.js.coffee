@app = angular.module('Application', ['ngRoute', 'ng-rails-csrf'])

@app.config([
  '$locationProvider'
  ($locationProvider) ->
    $locationProvider.html5Mode(true)
  ])

$(document).on 'ready page:load', ->
  angular.bootstrap document.body, ['Application']

$(document).on 'page:before-change', ->
  angular.element('body').scope().$broadcast("$destroy")
