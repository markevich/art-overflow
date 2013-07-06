$(document).on 'ready page:load', ->
  $('#button_load_more').on 'click', ->
    $.get 'pictures', (data) ->
      $('#button_load_more').hide()
      $('#pictures').append(data)
  $('.picture').on 'mouseover', ->
    img = $(@)
    img.css('opacity', 0.15)
    img.prev().show();
  .on 'mouseleave', ->
    img = $(@)
    img.css('opacity', 1)
    img.prev().hide();
