class GoodTunes.Routers.LoginsRouter extends Backbone.Router
  initialize: (options) ->
    @logins = new GoodTunes.Collections.LoginsCollection()
    @logins.reset options.logins

  routes:
    "new"      : "newLogin"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newLogin: ->
    @view = new GoodTunes.Views.Logins.NewView(collection: @logins)
    $("#logins").html(@view.render().el)

  index: ->
    @view = new GoodTunes.Views.Logins.IndexView(logins: @logins)
    $("#logins").html(@view.render().el)

  show: (id) ->
    login = @logins.get(id)

    @view = new GoodTunes.Views.Logins.ShowView(model: login)
    $("#logins").html(@view.render().el)

  edit: (id) ->
    login = @logins.get(id)

    @view = new GoodTunes.Views.Logins.EditView(model: login)
    $("#logins").html(@view.render().el)
