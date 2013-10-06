$(document).on 'ready page:load', ->
  $('#pictures').on 'mouseover', '.picture', ->
    img = $(@)
    img.css('opacity', 0.10)
    img.prev().show();
  .on 'mouseleave', '.picture', ->
    img = $(@)
    img.css('opacity', 1)
    img.prev().hide();
    
  $('.vote').on "ajax:success", (evt, xhr, settings) ->
    $('#like_button').toggle()
    $('#unlike_button').toggle()
    $('.js-button-watch').attr('data-voted', (idx, oldAttr) -> return !oldAttr )
    $('.picture-likes-count').html(xhr)
  .on 'ajax:before', ->
    $('.picture-likes-count').hide()
  .on 'ajax:complete', ->
    $('.picture-likes-count').show()

  #XXX it works only for 1 button. We have 3 on show page.
  if $('.js-button-watch').attr('data-voted')?
    $('#unlike_button').show()
  else
    $('#like_button').show()

  $('.reply-to-comment').on 'click', ->
    $(this).parents('.message-comment:first').find('.reply-to-comment-container:first').toggle()
