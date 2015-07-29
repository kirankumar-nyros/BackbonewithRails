Flow.Views.Getflows ||= {}

class Flow.Views.Getflows.NewView extends Backbone.View
  template: JST["backbone/templates/getflows/new"]

  events:
    "submit #new-getflow": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (getflow) =>
        @model = getflow
        window.location.hash = "/#{@model.id}"

      error: (getflow, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)
    $("#todo-show").html("")
    $("#todo-task").html("")

    return this
