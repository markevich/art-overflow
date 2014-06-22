$(document).on 'ready page:load', ->
  $('#picture_tag_list').tagsInput(
    'autocomplete_url' : '/tags'
    'width' : '600px',
    'height' : '',
    'defaultText' : ''
  );
