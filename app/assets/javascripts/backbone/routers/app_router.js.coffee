class GoodTunes.Routers.AppRouter extends Backbone.Router
  initialize: (options) ->
    @races = new GoodTunes.Collections.RacesCollection()
    @users = new GoodTunes.Collections.UsersCollection()
    
    @races.reset options.races
    @users.reset options.users

  routes:
    "races/new"         : "raceNew"
    "races/index"       : "raceIndex"
    "races/:id/edit"    : "raceEdit"
    "races/:id"         : "raceShow"
    "runners/new"       : "userNew"
    "runners/index"     : "userIndex"
    "runners/:id/edit"  : "userEdit"
    "runners/:id"       : "userShow"
    ".*"                : "raceIndex"

  raceNew: ->
    @view = new GoodTunes.Views.Races.NewView(collection: @races)
    $("#bb").html(@view.render().el)

  raceIndex: ->
    @view = new GoodTunes.Views.Races.IndexView(races: @races)
    $("#bb").html(@view.render().el)

  raceShow: (id) ->
    race = @races.get(id)

    # horrid hack to get mustache view working...
    race.set( { songs : race.get('playlist').songs })
    @view = new GoodTunes.Views.Races.ShowView(model: race)
    $("#bb").html(@view.render().el)

  raceEdit: (id) ->
    race = @races.get(id)

    @view = new GoodTunes.Views.Races.EditView(model: race)
    $("#bb").html(@view.render().el)


  userNew: ->
    @view = new GoodTunes.Views.Users.NewView(collection: @users)
    $("#bb").html(@view.render().el)

  userIndex: ->
    @view = new GoodTunes.Views.Users.IndexView(users: @users)
    $("#bb").html(@view.render().el)

  userShow: (id) ->
    user = @users.get(id)

    @view = new GoodTunes.Views.Users.ShowView(model: user)
    $("#bb").html(@view.render().el)

  userEdit: (id) ->
    user = @users.get(id)

    @view = new GoodTunes.Views.Users.EditView(model: user)
    $("#bb").html(@view.render().el)
