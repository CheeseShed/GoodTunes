GoodTunes
=========

Charity Marathon Running Sponsored Spotify Playlist Creator

### To run the app locally

* `git clone *this_repo*`
* `cd *this_repo*`
* install vagrant: http://www.vagrantup.com/downloads.html
* `vagrant up`
* `vagrant ssh`
* `cd /vagrant`
* bundle install
* rake db:drop
* rake db:migrate
* rake db:seed
* `rails server`

then on your local machine browse to:

`localhost:3000`



useful:

https://github.com/codebrew/backbone-rails