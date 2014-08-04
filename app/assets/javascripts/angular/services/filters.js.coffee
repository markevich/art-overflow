@app.factory 'Filters', ->
  class Filters
    constructor: (preloadedResources) ->
      @order = preloadedResources['order']
      @categories = preloadedResources['categories']

    setOrder: (key) ->
      for filter in @order
        filter.active = filter.key == key

    normalize: ->
      normalized = {}

      for order in @order
        normalized['order'] = order.key if order.active


      for category in @categories
        normalized['categories[]'] ||= []
        normalized['categories[]'].push(category.key) if category.active

      normalized
