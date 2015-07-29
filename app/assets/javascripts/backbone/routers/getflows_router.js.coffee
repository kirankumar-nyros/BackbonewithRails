class Flow.Routers.GetflowsRouter extends Backbone.Router
  
  initialize: (options) ->
    @getflows = new Flow.Collections.GetflowsCollection()
    @getflows.reset options.getflows
    @todos = new Flow.Collections.TodosCollection()
    @todos.reset options.todos
    @groups = new Flow.Collections.GroupsCollection()
    @groups.reset options.groups
    @events = new Flow.Collections.EventsCollection()
    @events.reset options.events
    

  routes:
    "new"      : "newGetflow"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"       : "index"
    "home"     :  "home"

    home: ->

  newGetflow: ->
    @view = new Flow.Views.Getflows.NewView(collection: @getflows)
    $("#getflows").html(@view.render().el)


  index: ->

    @view = new Flow.Views.Getflows.IndexView(collection: @getflows)
    $("#getflows").html(@view.render().el)
    @prjview = new Flow.Views.Getflows.ProjectView(collection: @getflows, todos: @todos)
    $("#projects-list").html(@prjview.render().el)
    $("#todo-show").html("")
    $(".todo-task").html("")
    @grpview = new Flow.Views.Groups.NewView(collection: @groups)
    $("#pgroups").html(@grpview.render().el)
    @groupsview = new Flow.Views.Groups.IndexView(collection: @groups)
    $("#groups-view").html(@groupsview.render().el)
    
    

  show: (id) ->
    getflow = @getflows.get(id)
    todos = @todos.get({ getflow_id: "#{getflow}" })
    @view = new Flow.Views.Getflows.ShowView(model: getflow)
    $("#getflows").html(@view.render().el)
    @prjview = new Flow.Views.Getflows.ProjectView(collection: @getflows, todos: @todos)
    $("#projects-list").html(@prjview.render().el)
    view = new Flow.Views.Todos.IndexView(collection: @todos, model: @model)
    $("#todo-show").html(view.render().el)
    @todoview = new Flow.Views.Todos.NewView(collection: @todos, getflow: getflow ,get_id: id)
    $(".todo-task").html(@todoview.render().el)    

  edit: (id) ->
    getflow = @getflows.get(id)
    @view = new Flow.Views.Getflows.EditView(model: getflow)
    $("#getflows").html(@view.render().el)
