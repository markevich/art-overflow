@app = angular.module('Application', ['ngRoute', 'ng-rails-csrf', 'ngResource', 'ngSanitize', 'infinite-scroll', 'templates'])

$(document).on 'ready', =>
  $element = $('[data-current-user]')
  currentUserData = $element.data('current-user')
  @app.value('currentUserData', currentUserData)
  $element.remove()

  angular.bootstrap document.body, ['Application']
