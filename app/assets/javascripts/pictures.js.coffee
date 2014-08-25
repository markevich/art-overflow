$(document).on 'ready', ->
  $('img').load ->
    $(@).addClass('loaded')

toggle_watched_buttons = (xhr, watcher) ->
  if xhr.state == 'inactive'
    watcher.find('.js-activate-button').show()
    watcher.find('.js-deactivate-button').hide()
  else
    watcher.find('.js-deactivate-button').show()
    watcher.find('.js-activate-button').hide()
  watcher.find('.counter').html(xhr.count)
  $('.profil-data .user-counters .followers .count').html(xhr.count)

$(document).on 'ajax:send', '.js-button-watch .js-remote-link', (evt, xhr, settings) ->
  counter = $(@).next('.counter-container')
  counter.find('.counter').hide()
  counter.find('.spinner-icon').show()

$(document).on 'ajax:complete', '.js-button-watch .js-remote-link', (evt, xhr, settings) ->
  counter = $(@).next('.counter-container')
  counter.find('.counter').show()
  counter.find('.spinner-icon').hide()

$(document).on 'ajax:success', '.js-button-watch .js-remote-link', (evt, xhr, settings) ->
  watcher = $($(@).closest('.js-button-watch'))
  toggle_watched_buttons(xhr, watcher)

$(document).on 'click', '.reply-to-comment', ->
  $(@).parents('.message-comment:first').find('.reply-to-comment-container:first').toggle()

$(document).on 'ready', ->
  $.adaptiveBackground.run()

  if $('.js-button-watch').length
    $.each $('.js-button-watch'), (_, element) ->
      element = $(element)
      if element.attr('data-voted')?
        element.find('.js-deactivate-button').show()
      else
        element.find('.js-activate-button').show()
