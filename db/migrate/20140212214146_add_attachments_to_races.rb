class AddAttachmentsToRaces < ActiveRecord::Migration
  def change
  	remove_column :races, :mainImage
  	remove_column :races, :secondImage
  	remove_column :races, :thirdImage
  	add_attachment :races, :mainImage
  	add_attachment :races, :secondImage
  	add_attachment :races, :thirdImage
  end
end
