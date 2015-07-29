class Flow.Models.Getflow extends Backbone.Model
  paramRoot: 'getflow'

  defaults: {}

class Flow.Collections.GetflowsCollection extends Backbone.Collection
  model: Flow.Models.Getflow
  url: '/getflows'

