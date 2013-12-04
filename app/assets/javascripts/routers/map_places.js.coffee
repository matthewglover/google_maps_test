class GoogleMaps.Routers.MapPlaces extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->

  index: ->
    @_getCurrentLocation()
    @_createFactualPlacesCollection()
    @_createFactualPlacesIndexView()
    @_createFactualPlacesMapView()
    @_createGeocoderCollection()
    @_createGeocoderView()

  _getCurrentLocation: ->
    new GoogleMaps.Custom.CurrentLocation (vent: GoogleMaps.Vent)

  _createFactualPlacesCollection: ->
    @factual_places_collection = new GoogleMaps.Collections.FactualPlaces (vent: GoogleMaps.Vent)
    @listenTo GoogleMaps.Vent,  'CurrentLocation:found', (lat, lng) ->
      @factual_places_collection.setLocation(lat, lng)

  _createFactualPlacesIndexView: ->
    @factual_places_view = new GoogleMaps.Views.FactualPlacesIndex (collection: @factual_places_collection, vent: GoogleMaps.Vent)
    $('#list').html (@factual_places_view.el)

  _createFactualPlacesMapView: ->
    @factual_places_map = new GoogleMaps.Views.FactualPlacesMap (collection: @factual_places_collection, vent: GoogleMaps.Vent)

  _createGeocoderCollection: ->
    @geocoder_collection = new GoogleMaps.Collections.Geocoder(vent: GoogleMaps.Vent)

  _createGeocoderView: ->
    @geocoder_view = new GoogleMaps.Views.Geocoder(collection: @geocoder_collection, vent: GoogleMaps.Vent)
    $('#geocoder').html (@geocoder_view.render().el)