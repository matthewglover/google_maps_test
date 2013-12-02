class GoogleMaps.Routers.MapPlaces extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    @current_location = new GoogleMaps.Custom.CurrentLocation
    @listenTo(@current_location, 'found', @buildMap)

  index: ->

  buildMap: (latitude, longitude)->
    @map = new GoogleMaps.Custom.Map(latitude, longitude)
    # map = new google.maps.Map(document.getElementById('map-canvas'),
    #   center: new google.maps.LatLng(LatLng.latitude, LatLng.longitude)
    #   zoom: 15
    # )