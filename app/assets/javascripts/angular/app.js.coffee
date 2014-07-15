@app = angular.module('Application', ['ngRoute', 'ng-rails-csrf', 'ngResource', 'ngSanitize', 'infinite-scroll'])

$(document).on 'ready page:load', ->
  angular.bootstrap document.body, ['Application']

$(document).on 'page:before-change', ->
  angular.element('body').scope().$broadcast("$destroy")
