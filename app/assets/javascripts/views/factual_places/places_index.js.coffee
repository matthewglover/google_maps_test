class GoogleMaps.Views.FactualPlacesIndex extends Backbone.View

  template: JST['factual_places/index']

  events:
    'click #more': 'loadMore'
    'click #check_total': 'checkTotal'

  initialize: (options)->
    @vent = options.vent
    @render()
    @listenTo(@collection, 'sync', @_addViews)
    @listenTo(@collection, 'setLocation', @_killViews)

  render: ->
    @$el.html(@template())
    @

  _addViews: =>
    @collection.each(@_addView)

  _addView: (model)=>
    unless _.findWhere(@_views(), model: model)
      view = new GoogleMaps.Views.IndexFactualPlace(model: model, vent: @vent)
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

