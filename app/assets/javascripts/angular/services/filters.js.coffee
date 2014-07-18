@app.factory 'Filters', ->
  class Filters
    constructor: (preloadedResources) ->
      @order = preloadedResources['order']

    setOrder: (key) ->
      for filter in @order
        filter.active = filter.key == key

    normalize: ->
      normalized = {}

      for filter in @order
        normalized['order'] = filter.key if filter.active

      normalized
