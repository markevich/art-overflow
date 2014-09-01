@app.factory 'Emotion', ($resource) ->
  $resource('/api/projects/:project_id/emotions/:id', {project_id: '@project_id'})
