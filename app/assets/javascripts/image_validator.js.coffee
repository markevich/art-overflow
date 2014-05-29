class @ImageValidator
  @validateImageType: (file, extensions) ->
    for extension in extensions
      return true if file.type.indexOf(extension) != -1
    false

  @validateImageSize: (file, maxSize) ->
    (file.size/1024/1024).toFixed(2) < maxSize

