class GoogleMaps.Views.Geocoder extends Backbone.View

  template: JST['geocoder/geocoder']
  tagName: 'div'

  events:
    'submit #new_addr': 'changeAddress'

  initialize: (options)->
    @vent = options.vent
    @listenTo(@collection, 'sync', @_syncViews)

  render: ->
    @$el.html(@template())
    @

  changeAddress: (event)=>
    event.preventDefault()
    @collection.geocode($('#new_address').val())

  # setLocation: (latitude, longitude)->
  #   console.log "geocoder setLocation...#{latitude} - #{longitude}"
  #   @parent_view.setLocation(latitude, longitude)

  _syncViews: =>
    @_killViews()
    @collection.each(@_syncView)

  _syncView: (model)=>
    unless _.findWhere(@_views(), model: model)
      view = new GoogleMaps.Views.Geocode(model: model, vent: @vent)
      @_views().push(view)
      @$('#geocodes').append(view.render().el)

  _killViews: ->
    @_killView _.first(@_views()) while @_views().length > 0

  _killView: (view)->
    if view?
      view.remove()
      @_views(_.without @_views(), view)

  _views: (ary=false)->
    if ary then @__view_array = ary else @__view_array ?= []