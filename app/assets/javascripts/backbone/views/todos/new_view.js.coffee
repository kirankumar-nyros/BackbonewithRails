Flow.Views.Todos ||= {}

class Flow.Views.Todos.NewView extends Backbone.View
  template: JST["backbone/templates/todos/new"]
  
  initialize: (attrs)->
     @getflow = attrs.getflow.id
     @collection = attrs.collection
     @get_id =attrs.get_id 
     @model = new @collection.model()
     @model.bind("change:errors", () =>
      this.render()
    )

  events:
    "submit #new-todo": "save"

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    
    @model.unset("errors")
    @model.set("getflow_id", @getflow)
    @collection.create(@model,
      success: (todo) =>
        @model = todo
        @model = new @collection.model()
        this.$("form").backboneLink(@model)
        this.render()
        window.location.hash = "/#{@getflow}"

      error: (todo, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    view = new Flow.Views.Todos.IndexView(collection: @collection)
    @$el.html(@template(@model.toJSON() ))
    $("#todo-show").html(view.render().el)
    this.$("form").backboneLink(@model)
    $("#todo-show").html('')
    @collection.each ((page) ->
      if page.get("getflow_id")== parseInt(@get_id)
        view = new Flow.Views.Todos.TodoView(model: page)
        $("#todo-show").append(view.render().el)
    ), this
    return this



  
  