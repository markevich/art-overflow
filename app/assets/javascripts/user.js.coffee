checkUserContent = ->
  for checkable in $('[data-check-user]')
    checkable = $(checkable)
    checkable.hide() if checkable.data('user-id') == window.current_user.id

$(document).on 'page:load', checkUserContent
$(document).ready -> checkUserContent()
