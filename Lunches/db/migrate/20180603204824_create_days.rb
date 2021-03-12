class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days, primary_key: :date, id: false do |t|
      t.string :date, null: false, default: "", primary: true

      t.timestamps
    end

  add_index :days, :date, unique: true
  end
end
