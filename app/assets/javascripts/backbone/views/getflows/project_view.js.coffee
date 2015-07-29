Flow.Views.Getflows ||= {}

class Flow.Views.Getflows.ProjectView extends Backbone.View
  template: JST["backbone/templates/getflows/project"]

  initialize: (attrs) ->
    @todos = attrs.todos
    type = "project"
    @todo = new Flow.Models.Todo()
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (getflow) =>
    myModel = new Flow.Models.Getflow()
    myModel.set("type", "project");
    prjview = new Flow.Views.Getflows.GetflowView({model : getflow, myModel})
    @$("tbody").append(prjview.render().el)
    
   
   
   
  render: =>
    @$el.html(@template(getflows: @collection.toJSON() ))
    @addAll()

    return this
