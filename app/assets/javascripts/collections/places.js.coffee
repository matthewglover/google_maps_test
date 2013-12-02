class GoogleMaps.Collections.Places extends Backbone.Collection

  model: GoogleMaps.Models.Place
  url: '/api/search'

  initialize: ->
    @listenTo(GoogleMaps.Vent, 'Map:home_marker:dragend', @setLocation)

  setLocation: (latitude, longitude)->
    @latitude = latitude
    @longitude = longitude
    @page = 1
    @trigger('setLocation', @latitude, @longitude)
    @reset()
    @_fetchData()

  fetchMore: ->
    @page += 1
    @_fetchData()

  _fetchData: ()->
    @fetch(
      remove: false
      success: @onFetched
      error: @onError
      data:
        latitude: @latitude
        longitude: @longitude
        page: @page
      )

  onFetched: (collection, response, options)=>
    # console.log('data fetched..')

  onError: (collection, response, options)=>
    # console.log('data error')