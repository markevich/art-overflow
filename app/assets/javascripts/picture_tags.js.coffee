$(document).on 'ready page:load', ->
  $('#picture_tag_list').tagsInput(
    'autocomplete_url' : 'http://localhost:3000/tags'
    'width' : '',
    'height' : '',
  );
