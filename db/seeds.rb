# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

case Rails.env
when "development", "test"
	Donation.create!([
	  {user_id: 1, donationId: "abc"},
	  {user_id: 1, donationId: "abc"},
	  {user_id: 1, donationId: "abc"},
	  {user_id: 1, donationId: "abc"},
	  {user_id: 1, donationId: "abc"}
	])
	Playlist.create!([
	  {race_id: 1}
	])
	Race.create!([
	  {name: "London Marathon", description: "26 tough miles!", date: "14/3/14", target: 2000, mainImage: nil, secondImage: nil, thirdImage: nil, route_id: nil, user_id: 2, playlist_id: nil}
	])
	Song.create!([
	  {spotify_id: "GBUM71200330", name: "Running", artist: "Jessie Ware", uri: "spotify:track:7dvgYLO6r33uGK11GYDoJA", donation_id: 1},
	  {spotify_id: "SEAYD8001020", name: "The Winner Takes It All", artist: "ABBA", uri: "spotify:track:1g1RLXmuXu7HpMA6gmiYve", donation_id: 2},
	  {spotify_id: "GBDUW0000059", name: "Harder Better Faster Stronger", artist: "Daft Punk", uri: "spotify:track:2cJz1loJp5EZM6shmQpLZN", donation_id: 3},
	  {spotify_id: "USRC10700303", name: "She Builds Quick Machines", artist: "Velvet Revolver", uri: "spotify:track:5kwVVnZ8ZjJanBbGmrbHsb", donation_id: 4},
	  {spotify_id: "FRZID1100110", name: "Where Them Girls At (feat. Nicki Minaj & Flo Rida)", artist: "David Guetta", uri: "spotify:track:7xV6oF0LMnrXKEs6JrWQXf", donation_id: 5}
	])

	Song.find(1).playlists << Playlist.find(1)
	Song.find(2).playlists << Playlist.find(1)
	Song.find(3).playlists << Playlist.find(1)
	Song.find(4).playlists << Playlist.find(1)
	Song.find(5).playlists << Playlist.find(1)

	User.create!([
	  {name: "Karen Amgfidaiihhg Baoescu", provider: "facebook", uid: "100007694199887", oauth_token: nil, oauth_expires_at: nil, isRunner: false},
	  {name: "Dorothy Amggfiaidjga Schrockmanescubergsonsteinsenwitzsky", provider: "facebook", uid: "100007769194071", oauth_token: nil, oauth_expires_at: nil, isRunner: true}
	])

when "production"
   
end