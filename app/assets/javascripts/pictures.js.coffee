$(document).on 'ready page:load', ->
  $('#button_load_more').on 'click', ->
    load_more_pictures (data) ->
      $('#button_load_more').hide()
      $('#pictures').append data
      enable_infinity_scrolling()

  $('.picture').on 'mouseover', ->
    img = $(@)
    img.css('opacity', 0.15)
    img.prev().show();
  .on 'mouseleave', ->
    img = $(@)
    img.css('opacity', 1)
    img.prev().hide();

load_more_pictures = (callback) ->
  $.get 'pictures', (data) ->
    callback(data)

enable_infinity_scrolling = ->
  $(window).data 'scroll_ready', true

  $(document).on 'scroll', ->
    return unless $(window).data('scroll_ready')

    if $(window).scrollTop() >= ($(document).height() - $(window).height())
      $(window).data 'scroll_ready', false
      load_more_pictures (data) ->
        $('#pictures').append data
        $(window).data 'scroll_ready', true
