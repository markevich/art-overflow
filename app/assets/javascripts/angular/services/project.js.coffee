@app.factory 'Project', ($resource) ->
  $resource('/projects')
