class GoogleMaps.Models.Geocode extends Backbone.Model

  initialize: ->

  parse: (response)->
    response.lat_lng = [response.geometry.location.lat, response.geometry.location.lng]
    response.latitude = response.geometry.location.lat
    response.longitude = response.geometry.location.lng
    response