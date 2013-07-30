class @Pager
  constructor: (@id, @container) ->

  start: ->
    $(document).on "scroll.#{@id}", =>
      pageAbove = @container.find('.pager:above-the-top:last').attr('data-page')
      @changePage(pageAbove) if pageAbove && @pageReallyChanged(pageAbove)

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
    history.replaceState(newState, '', "?page=#{page}")

  replaceState: (page) ->
    history.replaceState({page: page}, '', "?page=#{page}")

