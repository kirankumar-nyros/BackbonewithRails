Flow.Views.Events ||= {}

class Flow.Views.Events.IndexView extends Backbone.View
  template: JST["backbone/templates/events/index"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (event) =>
    view = new Flow.Views.Events.EventView({model : event})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(events: @collection.toJSON() ))
    @addAll()

    return this
