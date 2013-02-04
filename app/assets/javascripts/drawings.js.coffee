jQuery ->
 $('#new_drawing').fileupload
    dataType: 'script'
    progressall: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      $('#progress .bar').css(
        'width',
        progress + '%')
    # add: (e, data) ->
    #   