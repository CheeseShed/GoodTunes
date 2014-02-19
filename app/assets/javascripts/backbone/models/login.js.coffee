class GoodTunes.Models.Login extends Backbone.Model
  paramRoot: 'login'

  defaults:
    name: null

class GoodTunes.Collections.LoginsCollection extends Backbone.Collection
  model: GoodTunes.Models.Login
  url: '/logins'
