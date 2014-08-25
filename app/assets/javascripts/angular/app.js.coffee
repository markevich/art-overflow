@app = angular.module('Application', ['ngRoute', 'ng-rails-csrf', 'ngResource', 'ngSanitize', 'infinite-scroll', 'templates'])

$(document).on 'ready', ->
  angular.bootstrap document.body, ['Application']
