@app.factory 'Emotion', ($resource) ->
  $resource('/api/projects/:projectId/emotions/:id')
