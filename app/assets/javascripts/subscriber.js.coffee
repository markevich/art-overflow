class SubscriberValidator
  constructor: (@container) ->

  validate: ->
    for input in $(@container).find('input.required')
      value = $(input).val()
      return false unless value
      return validateEmail(value)
    return true

  validateEmail = (email) ->
    re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    return re.test email

$(document).ready ->
  $('[data-validate-promo]').on 'submit', ->
    valid = new SubscriberValidator(@).validate()
    unless valid
      inputs = $(@).find('input')
      if !inputs.hasClass('shake')
        inputs.addClass('shake')
      else
        inputs.css('animation-name', 'none')
        inputs.css('-moz-animation-name', 'none')
        inputs.css('-webkit-animation-name', 'none')
        setTimeout (-> inputs.css('-webkit-animation-name', 'shake')), 0
    return valid
