class @PicturesProcessor
  constructor: (@current_page, @page_size) ->
    $('#button_load_more').on 'click', (e) =>
      e.preventDefault();
      $('#button_load_more').hide()
      @loadNewPage =>
        @enableInfinityScrolling()

  loadNewPage: (callback) ->
    @current_page += 1
    query_params = "?page=#{@current_page}"
    $.ajax("/pictures#{query_params}")
    .done (data) ->
      return if data.length == 1 #it means that is no pictures no more
      History.pushState({page: @current_page}, null, query_params)
      $('#pictures').append data
      callback()

  enableInfinityScrolling: ->
    @loadingFinished()
    $(document).on 'scroll', =>
      return if @loadingNow()
      if $(window).scrollTop() >= ($(document).height() - $(window).height())
        @loadingStarted()
        @loadNewPage =>
          @loadingFinished()

  loadingNow: ->
    $(window).data 'loading'

  loadingStarted: ->
    $(window).data 'loading', true

  loadingFinished: ->
    $(window).data 'loading', false




# $(window).on 'statechange', ->
  # load_more_pictures (data) ->
    # $('#pictures').append data

$(document).on 'ready page:load', ->

  $('.picture').on 'mouseover', ->
    img = $(@)
    img.css('opacity', 0.15)
    img.prev().show();
  .on 'mouseleave', ->
    img = $(@)
    img.css('opacity', 1)
    img.prev().hide();
