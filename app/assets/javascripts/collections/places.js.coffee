class GoogleMaps.Collections.Places extends Backbone.Collection

  model: GoogleMaps.Models.Place
  url: '/api/search'

  initialize: (options)->
    @vent = options.vent
    @listenTo(@vent, 'Map:home_marker:dragend', @setLocation)
    @listenTo(@vent, 'Geocoder:geocode:setLocation', @setLocation)
    @listenTo(@, 'add', @_afterModelAdded)

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
      success: @_onFetched
      error: @_onError
      data:
        latitude: @latitude
        longitude: @longitude
        page: @page
      )

  _onFetched: (collection, response, options)->
    # console.log('data fetched..')

  _onError: (collection, response, options)->
    # console.log('data error')

  _afterModelAdded: (model) ->
    model.vent = @vent