$(document).on 'change', '#album_avatar', (e) ->
  cropData = $('#crop-parameters').data()

  updateCoordinates= (c) ->
    $('#album_crop_x').val(c.x)
    $('#album_crop_y').val(c.y)
    $('#album_crop_w').val(c.w)
    $('#album_crop_h').val(c.h)

  loadImage e.target.files[0], ((image) =>
      $("#crop-area").html(image)

      $.Jcrop '#crop-area',
        aspectRatio: cropData.thumbAspectRatio
        setSelect: [0, 0, cropData.width, cropData.height]
        minSize: [cropData.thumbWidth, cropData.thumbHeight]
        onChange: updateCoordinates
        onSelect: updateCoordinates

      $('#album_avatar').hide()
      $('#edit-avatar input[type=submit]').show()
      $.modal.resize()
    ),
      maxWidth: cropData.width,
      maxHeight: cropData.height,
