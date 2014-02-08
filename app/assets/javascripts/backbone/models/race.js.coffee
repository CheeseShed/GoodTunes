class GoodTunes.Models.Race extends Backbone.Model
  paramRoot: 'race'

  defaults:
    name: null
    description: null

class GoodTunes.Collections.RacesCollection extends Backbone.Collection
  model: GoodTunes.Models.Race
  url: '/races'
