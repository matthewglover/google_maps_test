class GoogleMaps.Custom.CurrentLocation
  _.extend @prototype, Backbone.Events

  constructor: ->
    navigator.geolocation.getCurrentPosition(@success, @error, @options)

  options:
    enableHighAccuracy: true
    timeout: 5000
    maximumAge: 3000

  success: (pos)=>
    @coords = pos.coords
    @trigger('found', @coords.latitude, @coords.longitude)

  error: (err)=>
    console.warn("ERROR(#{err.code}) #{err.message}")
    @trigger('error', err)