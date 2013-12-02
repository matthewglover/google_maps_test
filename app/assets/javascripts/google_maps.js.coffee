window.GoogleMaps =
  Models: {}
  Collections: {}
  Custom: {}
  Views: {}
  Routers: {}

  initialize: ->
    new GoogleMaps.Routers.MapPlaces
    Backbone.history.start()
    # _.extend(@, Backbone.Events)
    # @current_location = new GoogleMaps.Custom.CurrentLocation()
    # @listenTo(@current_location, 'found', @buildMap)

  # buildMap: (LatLng)->
  #   map = new google.maps.Map(document.getElementById('map-canvas'),
  #     center: new google.maps.LatLng(LatLng.latitude, LatLng.longitude)
  #     zoom: 15
  #   )

$(document).ready ->
  GoogleMaps.initialize()
