$(document).on 'ready', ->
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
      currentPage: parseInt(scrollable.attr('data-current-page'))
      preloader: scrollable.find('[data-scroller-preloader]')
      pager: new Pager(scrollable.data('id'), scrollable)

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
    @activate()

  setInstanceParams: (params) ->
    @id = params.id
    @currentPage = params.currentPage
    @container = params.container
    @preloader = params.preloader
    @fetchPath = params.fetchPath
    @pager = params.pager

  activate: ->
    @addNewPage =>
      @addNewPage =>
        @pager.start()
        @enableInfinityScrolling()

  addNewPage: (callback) ->
    @loadingStarted()
    @fetchFromServer (data) =>
      @pager.addPagerElement(@currentPage)
      @loadingFinished()
      @container.append data
      @container.attr('data-current-page', @currentPage)
      callback() if callback

  fetchFromServer: (callback) ->
    queryParams = $.getQuery()
    queryParams['page']=@currentPage
    queryString = '?' + $.param(queryParams)

    $.ajax(url: @fetchPath, data: $.parseQuery(queryString))
    .done (data) =>
      @currentPage = @currentPage + 1
      if $.trim(data)?.length
        callback(data)
      else
        @preloader.hide() #for now its a hack. We will no longer call fetch because loadingFinishedMethod is never fired

  enableInfinityScrolling: ->
    @loadingFinished()
    $(document).on "scroll.#{@id}", =>
      return if @loadingNow()
      if $(window).scrollTop() >= ($(document).height() - $(window).height()) - 450
        @addNewPage()

  loadingNow: ->
    $(window).data "loading.#{@id}"

  loadingStarted: ->
    $(window).data "loading.#{@id}", true
    @preloader.appendTo(@container)
    @preloader.show();

  loadingFinished: ->
    $(window).data "loading.#{@id}", false
    @preloader.hide();

