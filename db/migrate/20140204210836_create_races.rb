class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string :name
      t.string :description
      t.string :date
      t.integer :target
      t.binary :mainImage
      t.binary :secondImage
      t.binary :thirdImage
      t.integer :route_id
      t.integer :user_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
