class GoogleMaps.Views.IndexFactualPlace extends Backbone.View

  template: JST['factual_places/index_place']
  tagName: 'li'

  events:
    'click .showHide': 'toggleShow'
    'click .save': 'spotSave'

  initialize: ->

  render: ->
    @$el.html(@template(place: @model))
    @$el.removeClass("show")
    @$el.addClass("show") if @model.get('show')
    @

  toggleShow: ->
    @model.toggleShow()
    @render()

  spotSave: ->
    console.log "Saving spot #{@model.attributes}"
    console.log "#{key} - #{value}" for key, value of @model.attributes