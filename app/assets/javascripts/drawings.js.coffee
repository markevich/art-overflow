jQuery ->
 $('#new_drawing').fileupload
    dataType: 'script'
    add: (e, data) ->
      types = /(\.|\/)(gif|jpe?g|png)$/i
      file = data.files[0]
      if (types.test(file.type) || types.test(file.name)) && file.size < 1048576
        data.submit()
      else
        alert("#{file.name} file must be JPG, GIF or PNG, less than 1MB")
    progress: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      $('#progress .bar').css(
        'width',
        progress + '%')

    # add: (e, data) ->
    #   