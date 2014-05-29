$(document).on 'click', '.btn-download', ->
  $('input.file').click()

class ImageUploader
  constructor: ()->
    setImagePreview ->
      setJcrop()

  setImagePreview= (callback) ->
    $(document).on 'change', '#picture_path', (e) ->
      unless ImageValidator.validateImageSize(e.target.files[0], 20)
        $("#picture_path").replaceWith($("#picture_path").clone(true));
        alert('Размер изображения не должен превышать 20Mb')
        return
      unless ImageValidator.validateImageType(e.target.files[0], ['jpg', 'jpeg', 'png'])
        $("#picture_path").replaceWith($("#picture_path").clone(true));
        alert('Изображение должно быть в формате jpg, jpeg или png')
        return

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
    minWidth = cropData().thumbWidth
    minHeight = cropData().thumbHeight
    canvasWidth = parseInt($('#crop-area canvas').attr('width'))
    canvasHeight = parseInt($('#crop-area canvas').attr('height'))

    if canvasWidth < minWidth
      minWidth = canvasWidth
      minHeight = minWidth / 1.5
    else if canvasHeight < minHeight
      minHeight = canvasHeight
      minWidth = canvasHeight * 1.5

    $.Jcrop '#crop-area canvas',
      onChange: update
      onSelect: update
      minSize: [minWidth, minHeight]
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
      context.clearRect(0, 0, context.canvas.width, context.canvas.height)
      context.drawImage(imageObj, c.x, c.y, c.w, c.h, 0, 0, canvas.width, canvas.height)

new ImageUploader()
