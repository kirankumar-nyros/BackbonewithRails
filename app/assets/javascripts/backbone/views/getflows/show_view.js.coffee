Flow.Views.Getflows ||= {}

class Flow.Views.Getflows.ShowView extends Backbone.View
  template: JST["backbone/templates/getflows/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
