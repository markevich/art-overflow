$(document).ready ->
  $('form[id=new_comment]')
  .live("ajax:failure", (xhr, status, error) ->
    alert "failure!"
  ).live "ajax:success", (event, data)->
    $('#comment_body').val('')
    $('#comments-area').html(data)
    $('p.comment:first').effect("highlight", {}, 3000);



  # .live('ajax:failure') ->
  #   alert 'fail'