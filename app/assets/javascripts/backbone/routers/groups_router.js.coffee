class Flow.Routers.GroupsRouter extends Backbone.Router
  initialize: (options) ->
    @groups = new Flow.Collections.GroupsCollection()
    @groups.reset options.groups

  routes:
    "new"      : "newGroup"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"       : "index"

  newGroup: ->
    @view = new Flow.Views.Groups.NewView(collection: @groups)
    $("#groups").html(@view.render().el)

  index: ->
    @view = new Flow.Views.Groups.IndexView(collection: @groups)
    $("#groups").html(@view.render().el)

  show: (id) ->
    group = @groups.get(id)

    @view = new Flow.Views.Groups.ShowView(model: group)
    $("#groups").html(@view.render().el)

  edit: (id) ->
    group = @groups.get(id)

    @view = new Flow.Views.Groups.EditView(model: group)
    $("#groups").html(@view.render().el)
