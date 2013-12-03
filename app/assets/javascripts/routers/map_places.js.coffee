class GoogleMaps.Routers.MapPlaces extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->

  index: ->
    @_getCurrentLocation()
    @_createPlacesCollection()
    @_createPlacesIndexView()
    @_createPlacesMapView()
    @_createGeocoderCollection()
    @_createGeocoderView()

  _getCurrentLocation: ->
    new GoogleMaps.Custom.CurrentLocation (vent: GoogleMaps.Vent)

  _createPlacesCollection: ->
    @places_collection = new GoogleMaps.Collections.Places (vent: GoogleMaps.Vent)
    @listenTo GoogleMaps.Vent,  'CurrentLocation:found', (lat, lng) ->
      @places_collection.setLocation(lat, lng)

  _createPlacesIndexView: ->
    @places_view = new GoogleMaps.Views.PlacesIndex (collection: @places_collection, vent: GoogleMaps.Vent)
    $('#list').html (@places_view.el)

  _createPlacesMapView: ->
    @places_map = new GoogleMaps.Views.PlacesMap (collection: @places_collection, vent: GoogleMaps.Vent)

  _createGeocoderCollection: ->
    @geocoder_collection = new GoogleMaps.Collections.Geocoder(vent: GoogleMaps.Vent)

  _createGeocoderView: ->
    @geocoder_view = new GoogleMaps.Views.Geocoder(collection: @geocoder_collection, vent: GoogleMaps.Vent)
    $('#geocoder').html (@geocoder_view.render().el)