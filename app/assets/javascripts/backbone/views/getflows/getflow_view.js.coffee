Flow.Views.Getflows ||= {}

class Flow.Views.Getflows.GetflowView extends Backbone.View
  template: JST["backbone/templates/getflows/getflow"]
  initialize: (attrs)->
    @myModel = attrs.myModel
      

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @model.set(type: @myModel.toJSON().type)
    @$el.html(@template(@model.toJSON(), type: @myModel.toJSON().type))

    return this
