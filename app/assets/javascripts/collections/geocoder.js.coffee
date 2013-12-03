class GoogleMaps.Collections.Geocoder extends Backbone.Collection

  model: GoogleMaps.Models.Geocode
  url: 'http://maps.googleapis.com/maps/api/geocode/json'

  initialize: ->

  geocode: (address)->
    @fetch(
      success: @onSuccess
      error: @onError
      crossDomain: true
      data:
        address: address
        sensor: false
      )

  onSuccess: (model, response, options)=>
    console.log(response)

  onError: (model, response, options)=>
    console.log('data error')

  parse: (response)->
    if response.status == 'OK'
      response.results
    else
      console.log "Geocoder response error"
