scrollEvent = document.createEvent 'Events'
scrollEvent.initEvent('page:scroll', true, true)

$(document).on 'scroll', =>
  scrollNow = $(window).data 'scrolling'
  unless scrollNow
    document.dispatchEvent scrollEvent
    $(window).data('scrolling', true)
    setTimeout ->
      $(window).data 'scrolling', false
    , 250

