checkUserContent = ->
  for checkable in $('[data-check-user]')
    user_id = null
    user_id = window.current_user.id if window.current_user
    checkable = $(checkable)
    checkable.hide() if checkable.data('user-id') == user_id

$(document).on 'ready page:load', ->
  checkUserContent()

  $('.follow').on "ajax:success", (evt, xhr, settings) ->
    $('#follow_button').toggle()
    $('#unfollow_button').toggle()
    $('.buttons_following').attr('data-following', (idx, oldAttr) -> return !oldAttr )

  if $('.buttons_following').attr('data-following')?
    $('#unfollow_button').show()
  else
    $('#follow_button').show()