class CreateClients < ActiveRecord::Migration[5.1]
  def change
  	create_table :clients do |t|
  		# Будут созданы столбцы с типом text и названиями [name,phone и т.д.]
  		t.text :name 
  		t.text :phone
  		t.text :datestamp
  		t.text :barber
  		t.text :color

  		# Создает 2 столбца: created_at (дата создания) и update_at (дата обновления)
  		t.timestamps
  	end
  end
end
