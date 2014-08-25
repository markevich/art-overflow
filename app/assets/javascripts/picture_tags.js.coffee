$(document).on 'ready', ->
  $('#picture_tag_list').tagsInput(
    'autocomplete_url' : '/tags'
    'width' : '600px',
    'height' : '',
    'defaultText' : ''
  );
