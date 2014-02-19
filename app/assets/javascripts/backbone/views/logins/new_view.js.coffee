GoodTunes.Views.Logins ||= {}

class GoodTunes.Views.Logins.NewView extends Backbone.View
  template: JST["backbone/templates/logins/new"]

  events:
    "submit #new-login": "save"

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
      success: (login) =>
        @model = login
        window.location.hash = "/#{@model.id}"

      error: (login, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
