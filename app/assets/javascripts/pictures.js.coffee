$(document).on 'ready page:load', ->
  $('.picture').on 'mouseover', ->
    img = $(@)
    img.css('opacity', 0.10)
    img.prev().show();
  .on 'mouseleave', ->
    img = $(@)
    img.css('opacity', 1)
    img.prev().hide();
