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
      Shaker.shake(inputs)
    return valid

@toggleFlash = (message) ->
  $('#flash_toggle').bar
    message: message
    color: '#f8f6fa',
    background_color: 'rgba(125, 61, 151, 0.5)'
  $(document).on 'ready page:load', ->
    setTimeout ->
      $('#flash_toggle').trigger('click')
    , 300
