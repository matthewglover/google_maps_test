class GoogleMaps.Views.PlacesIndex extends Backbone.View

  template: JST['places/index']

  events:
    'click #more': 'loadMore'
    'click #check_total': 'checkTotal'

  initialize: ->
    @render()
    # @_addGecoderView()
    @listenTo(@collection, 'sync', @_addViews)
    @listenTo(@collection, 'setLocation', @_killViews)
    # @listenTo(BackboneLeaflet.Events, 'homeDragged', @setLocation)

  render: ->
    @$el.html(@template())
    @

  # _addGecoderView: ->
  #   geocoder = new BackboneLeaflet.Collections.Geocoder()
  #   view = new BackboneLeaflet.Views.Geocoder(collection: geocoder, parent_view: @)
  #   @listenTo(view, 'changeLocation',@_changeLocation)
  #   @$('#Geocoder').append(view.render().el)

  # setLocation: (latitude, longitude)->
  #   @collection.setLocation(latitude,longitude)

  _addViews: =>
    @collection.each(@_addView)

  _addView: (model)=>
    unless _.findWhere(@_views(), model: model)
      view = new GoogleMaps.Views.IndexPlace(model: model)
      @_views().push(view)
      @$('#PlaceList').append(view.render().el)

  loadMore: (event)=>
    event.preventDefault()
    @collection.fetchMore()

  # checkTotal: (event)=>
  #   event.preventDefault()
  #   console.log("No ims = #{@collection.length}")

  _killViews: ->
    @_killView _.first(@_views()) while @_views().length > 0

  _killView: (view)->
    if view?
      view.remove()
      @_views(_.without @_views(), view)

  _views: (ary=false)->
    if ary then @__view_array = ary else @__view_array ?= []

