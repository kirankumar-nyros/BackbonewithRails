Flow.Views.Getflows ||= {}

class Flow.Views.Getflows.IndexView extends Backbone.View
  template: JST["backbone/templates/getflows/index"]
  

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)


  addOne: (getflow) =>
    myModel = new Flow.Models.Getflow()
    myModel.set("type", "getflo");
    view = new Flow.Views.Getflows.GetflowView({model : getflow, myModel})
    @$("tbody").append(view.render().el)
    


  render: =>
    @$el.html(@template(getflows: @collection.toJSON() ))
    $('tbody').html(@template(getflows: @collection.toJSON() ))
    @addAll()

    return this
