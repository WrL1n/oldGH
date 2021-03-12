class CreateOrganisations < ActiveRecord::Migration[5.2]
  def change
    create_table :organisations do |t|
      t.string :name, null: false
      t.text :description, default: "", null: false
      t.string :path_to_image, default: "", null: false

      t.timestamps null: false
    end

  add_index :organisations, :name, unique: true
  end
end
