class Flow.Routers.EventsRouter extends Backbone.Router
  initialize: (options) ->
    @events = new Flow.Collections.EventsCollection()
    @events.reset options.events
    @getflows = new Flow.Collections.GetflowsCollection()
    @getflows.reset options.getflows
    @todos = new Flow.Collections.TodosCollection()
    @todos.reset options.todos
    @groups = new Flow.Collections.GroupsCollection()
    @groups.reset options.groups
 

  routes:
    "new"      : "newEvent"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newEvent: ->
    @view = new Flow.Views.Events.NewView(collection: @events)
    $("#events").html(@view.render().el)


  index: ->
    @view = new Flow.Views.Events.IndexView(collection: @events)
    $("#events").html(@view.render().el)
   
    
   


  show: (id) ->
    event = @events.get(id)

    @view = new Flow.Views.Events.ShowView(model: event)
    $("#events").html(@view.render().el)
   

  edit: (id) ->
    event = @events.get(id)

    @view = new Flow.Views.Events.EditView(model: event)
    $("#events").html(@view.render().el)
