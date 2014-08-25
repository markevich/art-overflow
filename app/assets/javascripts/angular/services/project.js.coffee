@app.factory 'Project', ($resource) ->
  $resource('/api/projects')
