Flow.Views.Todos ||= {}

class Flow.Views.Todos.IndexView extends Backbone.View
  template: JST["backbone/templates/todos/index"]

  initialize: (attrs) ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (todo) =>
    view = new Flow.Views.Todos.TodoView({model : todo})
    @$("tbody").append(view.render().el)
    


  render: =>
    @$el.html(@template(todos: @collection.toJSON() ))
    @addAll()

    return this

   