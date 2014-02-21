GoodTunes
=========

[![Build Status](https://api.travis-ci.org/CheeseShed/GoodTunes.png)](https://travis-ci.org/CheeseShed/GoodTunes)

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

## Endpoints

#### Race resources

- **GET races**
- **GET races/:id**
- **PUT races/:id**
  - Parameters:
    - name (string)
    - description (string)
    - date (string)
    - target
    - mainImage
    - secondImage
    - thirdImage
    - route_id
    - user_id
    - playlist_id
- **DELETE races/:id**

#### Runner resources

- **GET runners**
- **GET runners/:id**

#### Song resources

- **GET songs/search**
  - Parameters:
    - playlist_id (int)
    - song (string)
- **POST songs**
  - Parameters: 
    - playlist_id (int)
    - donation_id (int)
    - spotify_id (int)
    - name (string)
    - artist (string)
    - uri (uri)

#### Other endpoints

- **GET auth/facebook**
- **GET signout**
- **GET http://www.justgiving.com/JUSTGIVING_USERNAME/donate?amount=DONATION_AMOUNT&exitUrl=http://GOODTUNES_DOMAIN/justgiving/callback?donationId=JUSTGIVING-DONATION-ID**

#### Request formats

You must make your requests with the header "Accepts: application/json"

#### Response formats

All endpoints return JSON.

#### Authentication

All the PUT, POST and DELETE methods require a user to be signed-in.

useful:

https://github.com/codebrew/backbone-rails