checkUserContent = ->
  for checkable in $('[data-check-user]')
    checkable = $(checkable)
    checkable.hide() if checkable.data('user-id') == window.current_user.id

$(document).on 'ready page:load', ->
  checkUserContent

  $('.follow').on "ajax:success", (evt, xhr, settings) ->
    $('#follow_button').toggle()
    $('#unfollow_button').toggle()
    $('.buttons_following').attr('data-following', (idx, oldAttr) -> return !oldAttr )

  if $('.buttons_following').attr('data-following')?
    $('#unfollow_button').show()
  else
    $('#follow_button').show()