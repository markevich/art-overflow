checkUserContent = ->
  user_id = null
  user_id = window.current_user.id if window.current_user
  for checkable in $('[data-hide-if-owner]')
    checkable = $(checkable)
    checkable.hide() if checkable.data('user-id') == user_id

  for checkable in $('[data-show-if-owner]')
    checkable = $(checkable)
    checkable.hide() if checkable.data('user-id') != user_id

$(document).on 'ready page:load', ->
  checkUserContent()
