class GoogleMaps.Views.GSpotPlacesIndex extends Backbone.View

  template: JST['gspot_places/index']

  initialize: (options)->
    console.log('init GSpotPlacesIndex')
    @vent = options.vent
    @render()
    @listenTo(@collection, 'sync', @_addViews)

  render: ->
    @$el.html(@template())
    @

  _addViews: =>
    @collection.each(@_addView)

  _addView: (model)=>
    unless _.findWhere(@_views(), model: model)
      view = new GoogleMaps.Views.IndexGSpotPlace(model: model)
      @_views().push(view)
      @$('.goodspots').append(view.render().el)

  _views: (ary=false)->
    if ary then @__view_array = ary else @__view_array ?= []