Flow.Views.Groups ||= {}

class Flow.Views.Groups.IndexView extends Backbone.View
  template: JST["backbone/templates/groups/index"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (group) =>
    view = new Flow.Views.Groups.GroupView({model : group})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(groups: @collection.toJSON() ))
    @addAll()

    return this
