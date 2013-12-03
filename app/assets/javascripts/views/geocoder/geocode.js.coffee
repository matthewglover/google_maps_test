class GoogleMaps.Views.Geocode extends Backbone.View

  template: JST['geocoder/geocode']
  tagName: 'li'

  events:
    'click .go': '_setLocation'


  initialize: (options)->
    @vent = options.vent
    @render()

  render: ->
    @$el.html (@template(geocode: @model))
    @

  _setLocation: ->
    @vent.trigger('Geocoder:geocode:setLocation', @model.get("latitude"), @model.get('longitude'))