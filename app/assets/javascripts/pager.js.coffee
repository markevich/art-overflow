class @Pager
  constructor: (@id, @container) ->

  start: ->
    $(document).on "scroll.#{@id}", =>
      pageAbove = @container.find('.pager:above-the-top:last').attr('data-page')
      if pageAbove
        pageNum = pageAbove - 1
        @changePage(pageNum) if @pageReallyChanged(pageNum)

  addPagerElement: (newPage) ->
    pager = @container.find('.pager:last').clone()
    pager.attr('data-page', newPage)
    @container.append pager

  changePage: (newPage) ->
    @page = newPage
    if @hasTurbolinksState()
      @replaceTurbolinkState(newPage)
    else
      @replaceState(newPage)

  pageReallyChanged: (newPage) ->
    @page isnt newPage

  hasTurbolinksState:->
    history && history.state && history.state.turbolinks

  replaceTurbolinkState: (page) ->
    newState = history.state
    newState.page = page
    @setState(newState, page)

  replaceState: (page) ->
    @setState({ page: page }, page)

  setState: (state, page) ->
    queryParams = $.getQuery()
    queryParams['page'] = page
    queryString = '?' + $.param(queryParams)
    history.replaceState(state, '', queryString)


