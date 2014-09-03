@app.directive 'activeLink', ['$location', ($location) ->
  restrict: 'A'
  link: (scope, elem, attrs) ->
    path = if attrs.activeLink then 'activeLink' else 'href'
    target = if angular.isDefined(attrs.activeLinkParent) then elem.parent() else elem
    disabled = angular.isDefined(attrs.activeLinkDisabled)
    disabled = angular.isDefined(attrs.activeLinkDisabled)

    inPath = (needle, haystack) ->
      current = haystack == needle
      current ||= (haystack.indexOf(needle + '/') == 0)
      current

    toggleClass = (linkPath, locationPath) ->
      linkPath = if linkPath then linkPath.replace(/^\/sp#!/, '').replace(/\/+$/, '') else ''
      locationPath = locationPath.replace(/\/+$/, '')

      console.debug linkPath, locationPath
      if linkPath && inPath(linkPath, locationPath)
        target.addClass('active')
        target.removeClass('disabled') if disabled
      else
        target.removeClass('active')
        target.addClass('disabled') if disabled

    attrs.$observe path, (linkPath) ->
      toggleClass(linkPath, $location.path())

    scope.$watch(
      -> $location.path()
      (newPath) -> toggleClass attrs[path], newPath
    )
]
