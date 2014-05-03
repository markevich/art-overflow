$(document).on 'mouseover', '#pictures .picture', ->
  img = $(@)
  img.css('opacity', 0.10)
  img.prev().show();
.on 'mouseleave', '.picture', ->
  img = $(@)
  img.css('opacity', 1)
  img.prev().hide();

toggle_watched_buttons = (xhr, watcher) ->
  if xhr.state == 'inactive'
    watcher.find('.js-activate-button').show()
    watcher.find('.js-deactivate-button').hide()
  else
    watcher.find('.js-deactivate-button').show()
    watcher.find('.js-activate-button').hide()
  watcher.find('.active-count').html(xhr.count)
  $('.profil-data .user-counters .followers .count').html(xhr.count)

$(document).on 'ajax:success', '.js-button-watch .js-remote-link', (evt, xhr, settings) ->
  watcher = $($(@).closest('.js-button-watch'))
  toggle_watched_buttons(xhr, watcher)

$(document).on 'click', '.reply-to-comment', ->
  $(@).parents('.message-comment:first').find('.reply-to-comment-container:first').toggle()

$(document).on 'ready page:load', ->
  $.adaptiveBackground.run()

  if $('.js-button-watch').length
    $.each $('.js-button-watch'), (_, element) ->
      element = $(element)
      if element.attr('data-voted')?
        element.find('.js-deactivate-button').show()
      else
        element.find('.js-activate-button').show()
