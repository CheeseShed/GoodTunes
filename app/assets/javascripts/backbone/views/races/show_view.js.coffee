GoodTunes.Views.Races ||= {}

class GoodTunes.Views.Races.ShowView extends Backbone.View
  template: SMT['races/show']

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
