class GoogleMaps.Views.IndexGSpotPlace extends Backbone.View

  template: JST['gspot_places/index_place']
  tagName: 'li'

  initialize: ->
    super()

  render: ->
    @$el.html(@template(place: @model))
    @