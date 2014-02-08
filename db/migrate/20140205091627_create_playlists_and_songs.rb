class CreatePlaylistsAndSongs < ActiveRecord::Migration
  def change

    create_table :playlists do |t|
      t.timestamps
      t.belongs_to :race
    end
 
    create_table :songs do |t|
      t.string :spotify_id
      t.timestamps
    end
 
    create_table :playlists_songs do |t|
      t.belongs_to :playlist
      t.belongs_to :song
    end

  end
end