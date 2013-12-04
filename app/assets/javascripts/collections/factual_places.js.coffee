class GoogleMaps.Collections.FactualPlaces extends Backbone.Collection

  model: GoogleMaps.Models.FactualPlace
  url: '/api/factual/search'

  initialize: (options)->
    @vent = options.vent
    @listenTo(@vent, 'Map:home_marker:dragend', @setLocation)
    @listenTo(@vent, 'Geocoder:geocode:setLocation', @setLocation)
    @listenTo(@, 'add', @_afterModelAdded)

  setLocation: (lat, lng)->
    @lat = lat
    @lng = lng
    @page = 1
    @trigger('setLocation', @lat, @lng)
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
        lat: @lat
        lng: @lng
        page: @page
        radius: 300
      )

  _onFetched: (collection, response, options)->
    # console.log('data fetched..')

  _onError: (collection, response, options)->
    # console.log('data error')

  _afterModelAdded: (model) ->
    model.vent = @vent