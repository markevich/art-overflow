$(document).on 'ready page:load', ->
  $('#pictures').on 'mouseover', '.picture', ->
    img = $(@)
    img.css('opacity', 0.10)
    img.prev().show();
  .on 'mouseleave', '.picture', ->
    img = $(@)
    img.css('opacity', 1)
    img.prev().hide();

  toggle_watched_buttons = (xhr, watcher) ->
    if xhr.state == 'inactive'
      watcher.find('.activate-button').show()
      watcher.find('.deactivate-button').hide()
    else
      watcher.find('.deactivate-button').show()
      watcher.find('.activate-button').hide()
    watcher.find('.active-count').html(xhr.count) if xhr.count

  $('.js-button-watch').on "ajax:success", '.remote-link', (evt, xhr, settings) ->
    watcher = $($(@).closest('.js-button-watch'))
    toggle_watched_buttons(xhr, watcher)

  if $('.js-button-watch').length
    $.each $('.js-button-watch'), (_, element) ->
      element = $(element)
      if element.attr('data-voted')?
        element.find('.deactivate-button').show()
      else
        element.find('.activate-button').show()

  $('.reply-to-comment').on 'click', ->
    $(this).parents('.message-comment:first').find('.reply-to-comment-container:first').toggle()

  showPreview= (c) ->
    if (parseInt(c.w) > 0)
      imageObj = $('#crop-area canvas')[0]
      canvas = $('#crop-preview')[0]
      context = canvas.getContext('2d')
      console.log(canvas.width, canvas.height)
      context.drawImage(imageObj, c.x, c.y, c.w, c.h, 0, 0, canvas.width, canvas.height)

  $(document).on "change", "#picture_path", (e) ->
    cropData = $('#crop-area').data()
    loadImage e.target.files[0], ((canvas) =>
        $("#crop-area").html(canvas)
        $.Jcrop '#crop-area canvas',
          onChange: showPreview
          onSelect: showPreview
          aspectRatio: 300/200
      ),
        maxWidth: cropData.width,
        maxHeight: cropData.height,
        canvas: true
