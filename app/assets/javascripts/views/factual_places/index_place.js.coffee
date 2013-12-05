class GoogleMaps.Views.IndexFactualPlace extends Backbone.View

  template: JST['factual_places/index_place']
  tagName: 'li'

  events:
    'click .showHide': 'toggleShow'
    'click .save': 'spotSave'

  initialize: (options)->
    @vent = options.vent

  render: ->
    @$el.html(@template(place: @model))
    @$el.removeClass("show")
    @$el.addClass("show") if @model.get('show')
    @

  toggleShow: ->
    @model.toggleShow()
    @render()

  spotSave: ->
    console.log "Saving place: #{@model.get('name')}"
    @vent.trigger("FactualPlace:spotSave", @model)
