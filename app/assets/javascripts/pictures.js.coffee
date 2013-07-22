class @PicturesProcessor
  constructor: (@current_page, @page_size) ->
    $('#button_load_more').on 'click', (e) =>
      e.preventDefault();
      $('#button_load_more').hide()
      @loadNewPage =>
        @enableInfinityScrolling()

  loadNewPage: (callback) ->
    next_page = @current_page + 1
    query_params = "?page=#{next_page}"
    $.ajax("/pictures#{query_params}")
    .done (data) =>
      @current_page = next_page
      return unless $.trim(data)?.length #it means that is no pictures more
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

$(document).on 'ready page:load', ->
  $('.picture').on 'mouseover', ->
    img = $(@)
    img.css('opacity', 0.15)
    img.prev().show();
  .on 'mouseleave', ->
    img = $(@)
    img.css('opacity', 1)
    img.prev().hide();

jQuery ->
  $('.vote').on "ajax:success", (evt, xhr, settings) ->
    $('#' + xhr.hide).hide()
    $('#' + xhr.show).show()