class Flow.Models.Event extends Backbone.Model
  paramRoot: 'event'

  defaults:
    title: null
    color: null
    start: null
    end: null

class Flow.Collections.EventsCollection extends Backbone.Collection
  model: Flow.Models.Event
  url: '/events'
