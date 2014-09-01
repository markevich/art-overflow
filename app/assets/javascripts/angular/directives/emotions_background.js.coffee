@app.directive 'emotionsBackground', ->
  restrict: 'A'
  link: ($scope, $element, $attrs) ->
    paper.setup($element[0])
    $scope.$on 'emotionsUpdated', ->
      paper.project.clear() if paper.project
      $scope.emotionHandler.destroy() if $scope.emotionHandler
      $scope.emotionHandler = new EmotionsHandler($scope.emotionGroups)
      $scope.emotionHandler.startLoop()

class EmotionsHandler
  constructor: (@emotionGroups) ->
    window.a = true
    @interval = null
    @emotions = []
    @extractSpriteParts()

  startLoop: ->
    @createEmotions()
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


  startFrameLoop: ->
    paper.view.onFrame = (event) =>
      emotion.iterate(event.delta) for emotion in @emotions

  createEmotions: ->
    angular.forEach @emotionGroups, (emotions, type) =>
      for emotion, i in emotions
        @createEmotion(type)

  createEmotion: (type) ->
    plusOrMinus = -> if Math.random() < 0.5 then -1 else 1
    viewSize = paper.view.size
    position = new paper.Point(viewSize.width, viewSize.height).multiply(paper.Point.random())
    vectors =
      position: new paper.Point(50, 50).multiply(paper.Point.random()).add(20).multiply(new paper.Point(plusOrMinus(), plusOrMinus()))
      rotation: (100 * Math.random() + 20) * plusOrMinus()
    rotation = 360 * Math.random()
    scale = 0.5;
    layer = if window.a then 'secondLayer' else 'firstLayer'
    window.a = !window.a
    originCanvas = @spriteParts[layer][type]
    @emotions.push(new Emotion(originCanvas, position, rotation, scale, vectors))

  extractSpriteParts: ->
    firstLayerOffsetX = (number) -> 12 + 86 * number
    firstLayerOffsetY = 163
    firstLayerWidth = firstLayerHeight = 62

    secondLayerOffsetX = (number) -> 10 + 86 * number
    secondLayerOffsetY = 161 + 75
    secondLayerWidth = secondLayerHeight = 68

    @spriteRaster = new paper.Raster('emotions-sprite')
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

class Emotion
  constructor: (@originCanvas, @position, @rotation, @scale, @vectors) ->
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
      @position.x = 0 + bounds.radius;
      @vectors.position.x = -@vectors.position.x

    if bounds.right > view.width
      @position.x = view.width - bounds.radius
      @vectors.position.x = -@vectors.position.x

  getBoundingBox: ->
    bounds = @raster.bounds;
    center = bounds.center;

    radius: this.radius,
    top: center.y - this.radius,
    right: center.x + this.radius,
    bottom: center.y + this.radius,
    left: center.x - this.radius


