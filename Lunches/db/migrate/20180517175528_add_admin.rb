class AddAdmin < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :admin, :boolean, default: false
  	add_index :users, :admin
  end
end
