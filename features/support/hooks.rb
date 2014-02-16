#encoding: utf-8
#require_relative 'storage.rb'

Before do
  load "#{Rails.root}/db/seeds.rb"
  
  #delete_database backend_url('playlists')
end

After do |scenario|
  if scenario.failed?
    save_page
  end
  #delete_database backend_url('playlists')
end