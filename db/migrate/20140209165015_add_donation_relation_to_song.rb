class AddDonationRelationToSong < ActiveRecord::Migration
  def change
  	add_column :songs, :donation_id, :belongs_to
  end
end
