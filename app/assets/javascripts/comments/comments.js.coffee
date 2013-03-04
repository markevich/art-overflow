$(document).ready ->
  $('form[id=new_comment]')
  .on("ajax:failure", (xhr, status, error) ->
    alert "failure!"
  ).on "ajax:success", (event, data)->
    $('#comment_body').val('')
    $('#comments-area').html(data)
    $('.comment:first').effect("highlight", {}, 3000);



  # .live('ajax:failure') ->
  #   alert 'fail'
