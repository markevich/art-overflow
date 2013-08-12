$(document).on 'ready page:load', ->
  $('.picture').on 'mouseover', ->
    img = $(@)
    img.css('opacity', 0.10)
    img.prev().show();
  .on 'mouseleave', ->
    img = $(@)
    img.css('opacity', 1)
    img.prev().hide();
    
  $('.vote').on "ajax:success", (evt, xhr, settings) ->
    $('#like_button').toggle()
    $('#unlike_button').toggle()
    $('.buttons_like').attr('data-voted', (idx, oldAttr) -> return !oldAttr )
    $('.likes-count').html(xhr)  

  if $('.buttons_like').attr('data-voted')?
    $('#unlike_button').show()
  else
    $('#like_button').show()  

  $('.reply-to-comment').on 'click', ->
    $(this).parents('.message-comment:first').find('.reply-to-comment-container:first').toggle()
