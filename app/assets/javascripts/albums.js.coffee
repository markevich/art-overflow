$(document).on 'ajax:error', '#newAlbum form', (data, xhr, response) ->
  if xhr.status == 422
    $('.modal').html(xhr.responseText)
