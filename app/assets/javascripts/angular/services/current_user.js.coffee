@app.factory 'currentUser', ['$resource', 'User', 'currentUserData', ($resource, User, currentUserData) ->
  new User(currentUserData)
]
