Flow.Views.Groups ||= {}

class Flow.Views.Groups.ShowView extends Backbone.View
  template: JST["backbone/templates/groups/show"]

  render: ->
    @$el.html(@template(@model ))
    return this
