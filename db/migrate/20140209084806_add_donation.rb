class AddDonation < ActiveRecord::Migration
  def change
  	create_table :donations do |t|
      t.timestamps
      t.belongs_to :user
      t.string :donationId
    end
  end
end
