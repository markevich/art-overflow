@app.factory 'User', ($resource) ->
  $resource('/api/users/:id')
