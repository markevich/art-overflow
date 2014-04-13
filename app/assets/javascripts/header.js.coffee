$(document).on 'mouseover', '#upload-link', ->
  $(@).children().addClass 'hovered'
.on 'mouseleave click', '#upload-link', ->
  $(@).children().removeClass 'hovered'

$(document).on 'click', '#search', ->
  $(@).find('input').addClass 'active'
.on 'blur', '#search input', ->
  $(@).removeClass('active') unless !!$(@).val()

$(document).on 'mouseenter', '.user-menu', ->
  $('.ava img').addClass('user-menu-hover')

$(document).on 'mouseleave', '.user-menu ', ->
  $('.ava img').removeClass('user-menu-hover')

$(document).on 'click', '.sign-in', ->
  loginPanel = $('.login-user')
  if loginPanel.is(':visible')
    loginPanel.hide()
  else
    loginPanel.show()

