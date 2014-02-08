# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

case Rails.env
when "development"
User.delete_all
User.create(:id => 1, :name=>'Karen Amgfidaiihhg Baoescu', provider: "facebook", uid: "100007694199887", oauth_token: nil, oauth_expires_at: nil, created_at: "2014-02-06 09:46:40", updated_at: "2014-02-06 09:46:40", isRunner: false)
User.create(:id => 2, :name=>'Dorothy Amggfiaidjga Schrockmanescubergsonsteinsenwitzsky', provider: "facebook", uid: "100007769194071", oauth_token: nil, oauth_expires_at: nil, created_at: "2014-02-06 09:46:40", updated_at: "2014-02-06 09:46:40", isRunner: true)

Race.delete_all
Race.create(:id => 1, name: "London Marathon", description: "26 tough miles!", date: "14/3/14", target: 2000, mainImage: nil, secondImage: nil, thirdImage: nil, route_id: nil, user_id: 2, playlist_id: nil, created_at: "2014-02-08 13:45:42", updated_at: "2014-02-08 13:45:42")

Playlist.delete_all
Playlist.create(id: 1, created_at: "2014-02-08 13:45:42", updated_at: "2014-02-08 13:45:42", race_id: 1)

Song.delete_all
song = Song.new(id: 1, spotify_id: "GBUM71200330", created_at: "2014-02-08 21:31:25", updated_at: "2014-02-08 21:49:47", name: "Running", artist: "Jessie Ware", uri: "spotify:track:7dvgYLO6r33uGK11GYDoJA")
song.playlists << Playlist.find(1)
song.save()

song = Song.create(id: 2, spotify_id: "GBDUW0000059", created_at: "2014-02-08 21:50:43", updated_at: "2014-02-08 21:50:43", name: "Harder Better Faster Stronger", artist: "Daft Punk", uri: "spotify:track:2cJz1loJp5EZM6shmQpLZN")
song.playlists << Playlist.find(1)
song.save()

song = Song.create(id: 3, spotify_id: "SEAYD8001020", created_at: "2014-02-08 21:53:21", updated_at: "2014-02-08 21:53:21", name: "The Winner Takes It All", artist: "ABBA", uri: "spotify:track:1g1RLXmuXu7HpMA6gmiYve")
song.playlists << Playlist.find(1)
song.save()

when "production"
   
end