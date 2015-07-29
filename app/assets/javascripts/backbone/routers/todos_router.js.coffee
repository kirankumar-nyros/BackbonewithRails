class Flow.Routers.TodosRouter extends Backbone.Router
  initialize: (options) ->
    @todos = new Flow.Collections.TodosCollection()
    @todos.reset options.todos

  routes:
    "new"      : "newTodo"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"       : "index"
    "home"     :  "home"
    

  newTodo: ->
    @view = new Flow.Views.Todos.NewView(collection: @todos)
    $("#todos").html(@view.render().el)
    

  index: ->
    @view = new Flow.Views.Todos.IndexView(collection: @todos)
    $("#todos").html(@view.render().el)
    @view = new Flow.Views.Todos.NewView(collection: @todos)
    console.log @view.render().el
    $("#todos").append(@view.render().el)
    window.location.hash = "home"
   

    
  show: (id) ->
    todo = @todos.get(id)

    @view = new Flow.Views.Todos.ShowView(model: todo)
    $("#todos").html(@view.render().el)

  edit: (id) ->
    todo = @todos.get(id)

    @view = new Flow.Views.Todos.EditView(model: todo)
    $("#todos").html(@view.render().el)
