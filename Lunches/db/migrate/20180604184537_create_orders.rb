class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :day_date, null: false
      t.belongs_to :user
      t.integer :first_pos
      t.integer :second_pos
      t.integer :third_pos
      t.decimal "price", null: false

      t.timestamps
    end

    add_index :orders, :day_date
    add_index :orders, :price
  end
end
