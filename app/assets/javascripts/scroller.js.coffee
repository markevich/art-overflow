$(document).on 'ready page:load page:restore', ->
  InfinityScrollerManager.initialize()

class InfinityScrollerManager
  @initialize: ->
    stopOldScrollers()
    startNewScroller(scrollerParams) for scrollerParams in scrollables()

  stopOldScrollers = ->
    for oldScroller in ScrollerStorage.all()
      $(document).off ".#{oldScroller.id}"
    ScrollerStorage.clear()

  startNewScroller = (scroller_params) ->
    instance = new Scroller(scroller_params)
    ScrollerStorage.add(instance)

  scrollables = ->
    $.map $('[data-infinity-scrollable]'), (scrollable) ->
      scrollable = $(scrollable)
      id: scrollable.data('id')
      container: scrollable
      fetchPath: scrollable.data('fetch-path')
      currentPage: parseInt(scrollable.data('current-page'))
      triggerFunction: getTrigger(scrollable)
      preloader: scrollable.find('[data-scroller-preloader]')
      pager: new Pager(scrollable.data('id'), scrollable)

  getTrigger = (scrollable) ->
    trigger_element = scrollable.find(':visible[data-scroller-trigger]')
    trigger = null
    if trigger_element.length
      trigger = (callback) =>
        trigger_element.on 'click', (e) =>
          e.preventDefault()
          trigger_element.hide()
          callback()
    trigger

class ScrollerStorage
  @add: (scrollable) ->
    container().push scrollable

  @all: ->
    container()

  @clear: ->
    window.scrollables = []

  container = ->
    window.scrollables || []

class Scroller
  constructor: (params) ->
    @setInstanceParams(params)
    if @triggerFunction
      @activateByTrigger(@triggerFunction)
    else
      @activate()

  setInstanceParams: (params) ->
    @id = params.id
    @currentPage = params.currentPage
    @triggerFunction = params.triggerFunction
    @container = params.container
    @preloader = params.preloader
    @fetchPath = params.fetchPath
    @pager = params.pager

  activateByTrigger: (trigger) ->
    trigger =>
      @loadingStarted()
      @addNewPage =>
        @activate()

  activate: ->
    @pager.start()
    @enableInfinityScrolling()

  addNewPage: (callback) ->
    @fetchFromServer (data) =>
      @pager.addPagerElement(@currentPage)
      @container.append data
      @container.attr('data-current-page', @currentPage)
      callback()

  fetchFromServer: (callback) ->
    nextPage = @currentPage + 1
    queryParams = "?page=#{nextPage}"
    $.ajax(url: @fetchPath, data: $.parseQuery(queryParams))
    .done (data) =>
      @currentPage = nextPage
      if $.trim(data)?.length
        callback(data)
      else
        @preloader.hide() #for now its a hack. We will no longer call fetch because loadingFinishedMethod is never fired

  enableInfinityScrolling: ->
    @loadingFinished()
    $(document).on "page:scroll.#{@id}", =>
      return if @loadingNow()
      if $(window).scrollTop() >= ($(document).height() - $(window).height())
        @loadingStarted()
        @addNewPage =>
          @loadingFinished()

  loadingNow: ->
    $(window).data "loading.#{@id}"

  loadingStarted: ->
    $(window).data "loading.#{@id}", true
    @preloader.appendTo(@container)
    @preloader.show();

  loadingFinished: ->
    $(window).data "loading.#{@id}", false
    @preloader.hide();

