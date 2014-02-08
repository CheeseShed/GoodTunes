class AddSongNameAndArtistToSongModel < ActiveRecord::Migration
  def change
  	add_column :songs, :name, :string
  	add_column :songs, :artist, :string
  end
end
