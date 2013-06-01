checkUserContent = ->
  alert 1
  for checkable in $('data-check-user')
    console.log(checkable.data('user-id'))
    checkable.hide() if checkable.data('user-id') != window.current_user.id

document.addEventListener("page:load", checkUserContent)
