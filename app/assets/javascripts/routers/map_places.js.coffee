class GoogleMaps.Routers.MapPlaces extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->

  index: ->
    @_createPlacesCollection()
    @_createPlacesIndexView()
    @_createPlacesMapView()
    @_getCurrentLocation()

  _createPlacesCollection: ->
    @places_collection = new GoogleMaps.Collections.Places
    @listenTo GoogleMaps.Vent,  'CurrentLocation:found', (lat, lng) ->
      @places_collection.setLocation(lat, lng)

  _createPlacesIndexView: ->
    @places_view = new GoogleMaps.Views.PlacesIndex collection: @places_collection
    $('#list').html @places_view.el

  _createPlacesMapView: ->
    @places_map = new GoogleMaps.Views.PlacesMap collection: @places_collection

  _getCurrentLocation: ->
    new GoogleMaps.Custom.CurrentLocation