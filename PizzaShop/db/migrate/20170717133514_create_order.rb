class CreateOrder < ActiveRecord::Migration[5.1]
  def change
  	create_table :orders do |t|
  		t.text :name
  		t.text :phone
  		t.text :address
  		t.text :order_input

  		t.timestamps
  	end	
  end
end
