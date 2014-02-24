GoodTunes.Views.Users ||= {}

class GoodTunes.Views.Users.UserView extends Backbone.View
  template: SMT['users/user']

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
