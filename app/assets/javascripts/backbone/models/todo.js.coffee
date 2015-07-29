class Flow.Models.Todo extends Backbone.Model
  paramRoot: 'todo'

  defaults:
  
    content: null
    order: null
    done: null
    getflow_id: null

class Flow.Collections.TodosCollection extends Backbone.Collection
  model: Flow.Models.Todo
  url: '/todos'
