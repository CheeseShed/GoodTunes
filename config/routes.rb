GoodTunes::Application.routes.draw do

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  get 'songs/search' => 'songs#search'

  resources :songs, only: [:search, :create]

  resources :races

  resources :users, :path => "runners"

  # You can have the root of your site routed with "root"
  root 'races#index'

  # Facebook shizzle
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  # end of Facebook shizzle

  match 'justgiving/callback', to: 'justgivingcallback#index', via: [:get]
end
