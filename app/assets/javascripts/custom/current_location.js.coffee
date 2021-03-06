class GoogleMaps.Custom.CurrentLocation
  _.extend @prototype, Backbone.Events

  constructor: (options)->
    @vent = options.vent
    navigator.geolocation.getCurrentPosition @success, @error, @options

  options:
    enableHighAccuracy: true
    timeout: 5000
    maximumAge: 3000

  success: (pos)=>
    @vent.trigger 'CurrentLocation:found', pos.coords.latitude, pos.coords.longitude

  error: (err)=>
    console.warn "ERROR(#{err.code}) #{err.message}"