$(document).on 'click', '.btn-download', ->
  $('input.file').click()

class ImageUploader
  constructor: ()->
    setImagePreview ->
      setJcrop()

  setImagePreview= (callback) ->
    $(document).on 'change', '#picture_path', (e) ->
      $('#image-selector').hide()
      loadImage e.target.files[0], ((canvas) =>
          $("#crop-area").html(canvas)
          $('#crop').show()
          callback()
        ),
          maxWidth: cropData().width,
          maxHeight: cropData().height,
          canvas: true

  setJcrop= ->
    $.Jcrop '#crop-area canvas',
      onChange: update
      onSelect: update
      aspectRatio: cropData().thumbAspectRatio
      setSelect: [0, 0, cropData().width, cropData().height]

  cropData= ->
    $('#crop-parameters').data()

  update= (c) ->
    showPreview(c)
    updateCoordinates(c)

  updateCoordinates= (c) ->
    $('#picture_crop_x').val(c.x)
    $('#picture_crop_y').val(c.y)
    $('#picture_crop_w').val(c.w)
    $('#picture_crop_h').val(c.h)

  showPreview= (c) ->
    if (parseInt(c.w) > 0)
      imageObj = $('#crop-area canvas')[0]
      canvas = $('#crop-preview')[0]
      context = canvas.getContext('2d')
      context.drawImage(imageObj, c.x, c.y, c.w, c.h, 0, 0, canvas.width, canvas.height)

new ImageUploader()
