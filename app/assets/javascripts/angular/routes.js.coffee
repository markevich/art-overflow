@app.config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  # $locationProvider.html5Mode(true)
  $locationProvider.hashPrefix('!');

  $routeProvider
    .when '/abyss',
      templateUrl: 'abyss/index.html'
]
