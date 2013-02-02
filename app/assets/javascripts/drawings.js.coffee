jQuery ->
  $('#new_drawing input').live 'change', ->
    $('#new_drawing').submit()
  