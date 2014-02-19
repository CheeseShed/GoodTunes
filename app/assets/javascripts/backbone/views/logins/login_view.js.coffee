GoodTunes.Views.Logins ||= {}

class GoodTunes.Views.Logins.LoginView extends Backbone.View
  template: JST["backbone/templates/logins/login"]

  initialize: () ->
    this.render()

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template())
    return this
