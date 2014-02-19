GoodTunes.Views.Logins ||= {}

class GoodTunes.Views.Logins.EditView extends Backbone.View
  template : JST["backbone/templates/logins/edit"]

  events :
    "submit #edit-login" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (login) =>
        @model = login
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
