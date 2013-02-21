jQuery ->
  $('#follow_form').live "ajax:success", (evt, xhr, settings) ->
    $('#follow_form').attr('action', '/users/2/unfollow')
    $('#follow_form input[type=submit]').val('unfollow')
    $('#follow_form').attr('id', 'unfollow_form')


  $('#unfollow_form').live "ajax:success", (evt, xhr, settings) ->
    $('#unfollow_form').attr('action', '/users/2/follow')
    $('#unfollow_form input[type=submit]').val('follow')
    $('#unfollow_form').attr('id', 'follow_form')



