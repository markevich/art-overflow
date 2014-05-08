checkUserContent = ->
  current_user_id = null
  current_user_id = window.current_user.id if window.current_user
  for checkable in $('[data-hide-if-owner]')
    checkable = $(checkable)
    checkable.show() if checkable.data('user-id') != current_user_id

  for checkable in $('[data-show-if-owner]')
    checkable = $(checkable)
    checkable.show() if checkable.data('user-id') == current_user_id

$(document).on 'ready page:load', ->
  checkUserContent()
