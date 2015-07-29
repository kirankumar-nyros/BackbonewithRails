class Flow.Models.Group extends Backbone.Model
  paramRoot: 'group'

  defaults:
    name: null

class Flow.Collections.GroupsCollection extends Backbone.Collection
  model: Flow.Models.Group
  url: '/groups'
