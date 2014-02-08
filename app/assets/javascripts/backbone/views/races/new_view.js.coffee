GoodTunes.Views.Races ||= {}

class GoodTunes.Views.Races.NewView extends Backbone.View
  template: JST["backbone/templates/races/new"]

  events:
    "submit #new-race": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (race) =>
        @model = race
        window.location.hash = "/#{@model.id}"

      error: (race, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
