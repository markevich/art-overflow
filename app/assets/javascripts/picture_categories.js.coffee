$(document).on 'ready page:load', ->
  $("#edit_picture_form").on 'submit', ->
    values = $('input:checkbox:checked.category_checkbox').map ->
      return this.value;

    $("#picture_category_list").val(values.get())