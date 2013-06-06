class @Shaker
  @shake: (element) ->
    element = $(element)
    if !element.hasClass('shake')
      element.addClass('shake')
    else
      element.css('animation-name', 'none')
      element.css('-moz-animation-name', 'none')
      element.css('-webkit-animation-name', 'none')
      setTimeout (-> element.css('-webkit-animation-name', 'shake')), 0
