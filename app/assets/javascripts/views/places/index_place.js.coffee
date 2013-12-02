class GoogleMaps.Views.IndexPlace extends Backbone.View

  template: JST['places/index_place']
  tagName: 'li'

  events:
    'click .showHide': 'toggleShow'

  initialize: ->

  render: ->
    @$el.html(@template(place: @model))
    @$el.removeClass("show")
    @$el.addClass("show") if @model.get('show')
    @

  toggleShow: ->
    @model.toggleShow()
    @render()