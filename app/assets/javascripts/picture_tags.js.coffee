$(document).on 'ready page:load', ->
  $('#picture_tag_list').tagsInput(
    'autocomplete_url' : '/tags'
    'width' : '600px',
    'height' : '',
    'defaultText' : ''
  );

  $("#edit_picture_form").on 'submit', ->
    values = $('input:checkbox:checked.category_checkbox').map ->
      return this.value;

    $("#picture_category_list").val(values.get())