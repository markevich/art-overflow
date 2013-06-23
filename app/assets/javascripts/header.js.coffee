$(document).on 'ready page:load', ->
  $('#upload-button').on 'mouseover', ->
    $(@).children().addClass 'hovered'
  .on 'mouseleave', ->
    $(@).children().removeClass 'hovered'

  $('#search').on 'click', ->
    $(@).children().addClass 'active'
  .children().on 'blur', ->
    $(@).removeClass('active') unless !!$(@).val()

#:javascript
#  $(document).on('ready', function(){
#    $('#upload-button').on('mouseover', function(){
#    $(this).children().addClass('hovered');
#  })
#  .on('mouseleave', function(){
#    $(this).children().removeClass('hovered');
#    })
#  })
#
#
#  $(document).on('ready', function(){
#    $('#quest').on('click', function(){
#      $(this).children().addClass('active');
#    })
#  $('#quest').children().on('blur', function(){
#    if($(this).val().length == 0){
#      $(this).removeClass('active');
#    }
#    });
#
#  })
