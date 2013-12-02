class GoogleMaps.Models.Place extends Backbone.Model

  # defaults:
  #   show: false

  initialize: ->
    # console.log "init"

  toggleShow: ->
    @set('show', !@get('show'))
    @trigger('toggle_show')

