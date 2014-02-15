class GoodTunes.Models.User extends Backbone.Model
  paramRoot: 'user'

  defaults:
    name: null

class GoodTunes.Collections.UsersCollection extends Backbone.Collection
  model: GoodTunes.Models.User
  url: '/users'
