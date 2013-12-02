class GoogleMaps.Views.MapPlace extends Backbone.View

  initialize: (options)->
    @map = options.map
    @listenTo(@model, 'toggle_show', @toggleShow)

  toggleShow: =>
    if @model.get('show')
      @marker = @map.addMarker(@model.get('latitude'), @model.get('longitude'))
      @map.bindPopup(@marker, @model.get('name'))
    else
      @map.removeMarker(@marker)

  remove: ->
    @map.removeMarker(@marker) if @marker?
    super()