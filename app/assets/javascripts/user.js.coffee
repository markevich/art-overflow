checkUserContent = ->
  for checkable in $('[data-check-user]')
    user_id = null
    user_id = window.current_user.id if window.current_user
    checkable = $(checkable)
    checkable.hide() if checkable.data('user-id') == user_id

$(document).on 'ready page:load', ->
  checkUserContent()
