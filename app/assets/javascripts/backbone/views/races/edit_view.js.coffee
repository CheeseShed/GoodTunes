GoodTunes.Views.Races ||= {}

class GoodTunes.Views.Races.EditView extends Backbone.View
  template : JST["backbone/templates/races/edit"]

  events :
    "submit #edit-race" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (race) =>
        @model = race
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
