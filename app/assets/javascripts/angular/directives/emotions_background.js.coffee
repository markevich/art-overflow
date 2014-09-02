@app.directive 'emotionsBackground', ->
  restrict: 'A'
  link: ($scope, $element, $attrs) ->
    paper.setup($element[0])
    $scope.$on 'emotionsUpdated', ->
      $scope.emotionsFactory ||= new EmotionsFactory()
      paper.project.clear() if paper.project
      $scope.emotionHandler.destroy() if $scope.emotionHandler
      $scope.emotionHandler = new EmotionsHandler($scope.emotionGroups, $scope.emotionsFactory)
      $scope.emotionHandler.startLoop()

class @EmotionsHandler
  constructor: (@emotionGroups, @factory) ->
    @interval = null
    @emotions = []

  startLoop: ->
    @createEmotions()
    @sortEmotions()
    @startFrameLoop()
    @fadeInEmotions()

  destroy: ->
    clearInterval(@interval)

  fadeInEmotions: ->
    return unless @emotions.length
    index = -1
    @interval = setInterval =>
      index += 1
      clearInterval(@interval) if index == @emotions.length - 1
      @emotions[index].show()
    , 70

  sortEmotions: ->
    compare = (a,b) ->
      if (a.blured && b.blured) || (!a.blured && !b.blured)
        return 1 if a.scale < b.scale
        return -1 if a.scale > b.scale
        return 0

      return -1 if a.blured && !b.blured
      return 1 if b.blured && !a.blured

    @emotions.sort(compare)
    emotion.raster.bringToFront() for emotion in @emotions


  startFrameLoop: ->
    paper.view.onFrame = (event) =>
      emotion.iterate(event.delta) for emotion in @emotions

  createEmotions: ->
    angular.forEach @emotionGroups, (emotions, type) =>
      sizeGroups = @numberToEmotionsGroups(emotions.length)
      for emotionSize in sizeGroups
        emotion = @factory.create(type, emotionSize)
        @emotions.push(emotion)

  numberToEmotionsGroups: (count) ->
    initialGroups = []
    return initialGroups unless count

    count = count - 15
    fixedSmalls = if count < 0 then 15 + count else 15
    initialGroups.push('s') for [1..fixedSmalls]
    count = 0 if count < 0

    acc = { groups: initialGroups, rest: count, sizing: {xxl: 100, xl: 30, l: 15, m: 3, s: 1} }
    loop
      acc = @injectRestGroups(acc)
      break unless acc.rest
    acc.groups

  injectRestGroups: (acc) ->
    return acc unless acc.rest
    for own key, size of acc.sizing
      continue if acc.rest < size
      times = Math.floor(acc.rest / size)
      acc.rest = acc.rest % size
      acc.groups.push(key) for [1..times]
      return acc


class Emotion
  constructor: (@originCanvas, @position, @rotation, @scale, @vectors, @blured) ->
    @raster = new paper.Raster(@originCanvas)
    @hide()
    @raster.scale(@scale)
    @radius = @raster.bounds.height / 2
    @updateShape()

  hide: ->
    @raster.visible = false

  show: ->
    @raster.visible = true

  updateShape: ->
    @raster.position = @position
    @raster.rotation = @rotation

  iterate: (delta)->
    positionVector = @vectors.position
    rotation = @vectors.rotation

    @position = @position.add(positionVector.multiply(delta))
    @rotation = @rotation + rotation * delta

    @updateShape()
    @checkBounds()

  checkBounds: ->
    view = paper.view.size
    bounds = @getBoundingBox()

    if bounds.bottom > view.height
      @position.y = view.height - bounds.radius
      @vectors.position.y = -@vectors.position.y

    if bounds.top < 0
      @position.y = 0 + bounds.radius
      @vectors.position.y = -@vectors.position.y

    if bounds.left < 0
      @position.x = 0 + bounds.radius
      @vectors.position.x = -@vectors.position.x

    if bounds.right > view.width
      @position.x = view.width - bounds.radius
      @vectors.position.x = -@vectors.position.x

  getBoundingBox: ->
    bounds = @raster.bounds
    center = bounds.center

    radius: this.radius,
    top: center.y - this.radius,
    right: center.x + this.radius,
    bottom: center.y + this.radius,
    left: center.x - this.radius

class EmotionsFactory
  constructor: ->
    @extractSpriteParts()

  create: (type, size) ->
    properties = sizeProperties()[size]
    position = randomPosition()
    rotation = 360 * Math.random()
    scale = properties.scale
    blured = if Math.random() < properties.blurChance then true else false
    spriteLayer = if blured then 'secondLayer' else 'firstLayer'
    originCanvas = @spriteParts[spriteLayer][type]

    velocityMultiplier = properties.velocityMultiplier
    velocityMultiplier = velocityMultiplier / 3 if blured
    vectors = randomVectors(velocityMultiplier)

    new Emotion(originCanvas, position, rotation, scale, vectors, blured)

  sizeProperties = ->
    xxl:
      scale: 0.8
      velocityMultiplier: 0.3
      blurChance: 0.8
    xl:
      scale: 0.6
      velocityMultiplier: 0.5
      blurChance: 0.6
    l:
      scale: 0.5
      velocityMultiplier: 0.6
      blurChance: 0.4
    m:
      scale: 0.4
      velocityMultiplier: 0.8
      blurChance: 0.3
    s:
      scale: 0.3
      velocityMultiplier: 0.9
      blurChance: 0.2

  randomSign = ->
    if Math.random() < 0.5 then -1 else 1

  randomPosition = ->
    new paper.Point(paper.view.size.width, paper.view.size.height).multiply(paper.Point.random())

  randomVectors = (multiplier)->
    position: new paper.Point(50, 50).multiply(paper.Point.random()).add(20).multiply(new paper.Point(randomSign(), randomSign())).multiply(new paper.Point(multiplier, multiplier))
    rotation: (100 * Math.random() + 20) * randomSign() * multiplier

  extractSpriteParts: ->
    firstLayerOffsetX = (number) -> 12 + 86 * number
    firstLayerOffsetY = 163
    firstLayerWidth = firstLayerHeight = 62

    secondLayerOffsetX = (number) -> 10 + 86 * number
    secondLayerOffsetY = 161 + 75
    secondLayerWidth = secondLayerHeight = 68

    @spriteRaster = new paper.Raster('emotions-sprite', new paper.Point(-1000, -1000))
    @spriteRaster.visible = false
    @spriteParts =
     firstLayer:
       Cute: @spriteRaster.getSubCanvas(new paper.Rectangle(firstLayerOffsetX(0), firstLayerOffsetY, firstLayerWidth, firstLayerHeight))
       Facepalm: @spriteRaster.getSubCanvas(new paper.Rectangle(firstLayerOffsetX(1), firstLayerOffsetY, firstLayerWidth, firstLayerHeight))
       Rapture: @spriteRaster.getSubCanvas(new paper.Rectangle(firstLayerOffsetX(2), firstLayerOffsetY, firstLayerWidth, firstLayerHeight))
       Wtf: @spriteRaster.getSubCanvas(new paper.Rectangle(firstLayerOffsetX(3), firstLayerOffsetY, firstLayerWidth, firstLayerHeight))
       Inspiration: @spriteRaster.getSubCanvas(new paper.Rectangle(firstLayerOffsetX(4), firstLayerOffsetY, firstLayerWidth, firstLayerHeight))
     secondLayer:
       Cute: @spriteRaster.getSubCanvas(new paper.Rectangle(secondLayerOffsetX(0), secondLayerOffsetY, secondLayerWidth, secondLayerHeight))
       Facepalm: @spriteRaster.getSubCanvas(new paper.Rectangle(secondLayerOffsetX(1), secondLayerOffsetY, secondLayerWidth, secondLayerHeight))
       Rapture: @spriteRaster.getSubCanvas(new paper.Rectangle(secondLayerOffsetX(2), secondLayerOffsetY, secondLayerWidth, secondLayerHeight))
       Wtf: @spriteRaster.getSubCanvas(new paper.Rectangle(secondLayerOffsetX(3), secondLayerOffsetY, secondLayerWidth, secondLayerHeight))
       Inspiration: @spriteRaster.getSubCanvas(new paper.Rectangle(secondLayerOffsetX(4), secondLayerOffsetY, secondLayerWidth, secondLayerHeight))

    @spriteRaster.remove()
