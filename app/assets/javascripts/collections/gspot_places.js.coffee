class GoogleMaps.Collections.GSpotPlaces extends Backbone.Collection

  model: GoogleMaps.Models.GSpotPlace
  url: '/api/places'

  init: (options)->
    @vent = options.vent
    @listenTo(@vent, "FactualPlace:spotSave", @create)
    @

  fetch: ()->
    super (remove: false)

  create: (model, options={})->
    console.log('saving...')
    attributes =
      place:
        factual_id: model.get('factual_id')
        name: model.get('name')
        address: model.get('address')
        region: model.get('region')
        country: model.get('country')
        postcode: model.get('postcode')
        lat: model.get('latitude')
        lng: model.get('longitude')
        telephone: model.get('tel')
        spots_attributes: [ keywords: 'restaurant' ]
    options.error = @onError
    super(attributes, options)

  onError: (model, xhr, options)->
    status = xhr.status
    statusText = xhr.statusText
    errors = xhr.responseJSON.errors
    console.log "Error - #{status} - #{statusText}"
    console.log errors
    console.log "Factual id #{errors.factual_id.join(', ')}" if errors.factual_id?
