@app.factory 'ProjectsLoader', (Project) ->
  class ProjectsLoader
    constructor: ->
      @projects = []
      @busy = false
      @page = 0
      @filters = {}

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

      query_options = $.extend {}, { page: @page }, @filters
      new_projects = Project.query(query_options).$promise.then (new_projects) =>
        callback(new_projects)
        @page = @page + 1
        @busy = false

