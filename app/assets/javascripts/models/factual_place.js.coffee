class GoogleMaps.Models.FactualPlace extends Backbone.Model

  # defaults:
  #   show: false

  initialize: ->
    # console.log "init"

  toggleShow: ->
    @set('show', !@get('show'))
    @trigger('toggle_show')

