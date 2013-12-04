class GoogleMaps.Views.MapFactualPlace extends Backbone.View

  initialize: (options)->
    @list_pos = options.list_pos
    @map = options.map
    @map.addPoint(@model.get('latitude'), @model.get('longitude'))
    @listenTo(@model, 'toggle_show', @toggleShow)

  toggleShow: =>
    if @model.get('show')
      iconObject = @map._createNumericIcon(@list_pos)
      @marker = @map.createMarker(@model.get('latitude'), @model.get('longitude'), icon: iconObject)
      @map.showMarker(@marker)
      @map.bindPopup(@marker, @model.get('name'))
    else
      @map.removeMarker(@marker)

  remove: ->
    @map.removeMarker(@marker) if @marker?
    super()