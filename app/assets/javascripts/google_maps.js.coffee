window.GoogleMaps =
  Models: {}
  Collections: {}
  Custom: {}
  Views: {}
  Routers: {}
  Vent: _.extend({}, Backbone.Events)

  initialize: ->
    new GoogleMaps.Routers.MapPlaces
    Backbone.history.start()

$(document).ready ->
  GoogleMaps.initialize()
