class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title,          null: false
      t.text :description,      null: false, default: ""
      t.decimal :price,         null: false
      t.string :path_to_image,  null: true, default: ""
      t.integer :position,      null: false
      t.boolean :in_menu,       default: false
      t.integer :menu_id,       default: 1

      t.timestamps
    end

  add_index :products, :title, unique: true
  end
end
