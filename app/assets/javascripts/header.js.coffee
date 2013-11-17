$(document).on 'ready page:load', ->
  $('#upload-link').on 'mouseover', ->
    $(@).children().addClass 'hovered'
  .on 'mouseleave click', ->
    $(@).children().removeClass 'hovered'

  $('#search').on 'click', ->
    $(@).children().addClass 'active'
  .children().on 'blur', ->
    $(@).removeClass('active') unless !!$(@).val()

  $(document).on 'mouseenter', '.user-menu', ->
    $('.ava img').addClass('user-menu-hover')

  $(document).on 'mouseleave', '.user-menu ', ->
    $('.ava img').removeClass('user-menu-hover')
