@app.filter 'truncate', ->
  (text, length, end) ->
    unless text == undefined
      length = 10 if isNaN length
      end = "..." if end == undefined

      if text.length <= length || text.length - end.length <= length
        text
      else
        String(text).substring(0, length - end.length) + end;
