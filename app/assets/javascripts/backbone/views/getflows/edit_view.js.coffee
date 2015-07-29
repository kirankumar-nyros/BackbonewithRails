Flow.Views.Getflows ||= {}

class Flow.Views.Getflows.EditView extends Backbone.View
  template: JST["backbone/templates/getflows/edit"]

  events:
    "submit #edit-getflow": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (getflow) =>
        @model = getflow
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
