$(document).on 'change', '#user_avatar', (e) ->
  cropData = $('#crop-parameters').data()

  updateCoordinates= (c) ->
    $('#user_crop_x').val(c.x)
    $('#user_crop_y').val(c.y)
    $('#user_crop_w').val(c.w)
    $('#user_crop_h').val(c.h)

  loadImage e.target.files[0], ((image) =>
      $("#crop-area").html(image)

      $.Jcrop '#crop-area',
        aspectRatio: cropData.thumbAspectRatio
        setSelect: [0, 0, cropData.width, cropData.height]
        minSize: [cropData.thumbWidth, cropData.thumbHeight]
        onChange: updateCoordinates
        onSelect: updateCoordinates

      $('#user_avatar').hide()
      $('#edit-user-avatar input[type=submit]').show()
      $.modal.resize()
    ),
      maxWidth: cropData.width,
      maxHeight: cropData.height,
