$(document).on $.modal.BEFORE_OPEN, (e, modal) ->
  modal_options = $('#modal-options')
  return unless modal_options.length
  modal.elm.addClass(modal_options.data('class'))
