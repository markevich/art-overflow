$(document).on 'ready page:load', ->
  $("div[class^='flash-']").delay(3000).fadeOut(1000)

$(document).on 'click', "div[class^='flash-'] span.close", ->
  $(@).parent().hide()
