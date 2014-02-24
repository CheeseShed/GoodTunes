GoodTunes.Views.Races ||= {}

class GoodTunes.Views.Races.RaceView extends Backbone.View
  template: SMT['races/race']

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
