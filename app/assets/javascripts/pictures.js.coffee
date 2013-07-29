$(document).on 'ready page:load', ->
  $('.picture').on 'mouseover', ->
    img = $(@)
    img.css('opacity', 0.15)
    img.prev().show();
  .on 'mouseleave', ->
    img = $(@)
    img.css('opacity', 1)
    img.prev().hide();

jQuery ->
  $('.vote').on "ajax:success", (evt, xhr, settings) ->
    $('#' + xhr.hide).hide()
    $('#' + xhr.show).show()
