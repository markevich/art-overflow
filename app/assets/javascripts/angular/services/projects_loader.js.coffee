@app.factory 'ProjectsLoader', (Project) ->
  class ProjectsLoader
    constructor: ->
      @projects = []
      @busy = false
      @page = 0
      @filters = {
        order: 'popular'
      }

    reset: ->
      @busy = false
      @page = 0

      @performRequest (new_projects) =>
        @projects = new_projects


    loadMore: ->
      @performRequest (new_projects) =>
        return unless new_projects.length
        @projects = @projects.concat(new_projects)


    performRequest: (callback) ->
      return if @busy
      @busy = true

      new_projects = Project.query(page: @page).$promise.then (new_projects) =>
        callback(new_projects)
        @page = @page + 1
        @busy = false

