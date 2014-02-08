class AddUserTypeToUser < ActiveRecord::Migration
  def change
  	add_column :users, :isRunner, :boolean, :default => false
  end
end
