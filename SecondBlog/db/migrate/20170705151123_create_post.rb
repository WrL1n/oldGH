class CreatePost < ActiveRecord::Migration[5.1]
  def change
  	create_table :posts do |t|
  		# Будут созданы столбцы с типом text и названиями [name,phone и т.д.]
  		t.text :post_topic
  		t.text :post_text  		
  		t.text :post_author

  		# Создает 2 столбца: created_at (дата создания) и update_at (дата обновления)
  		t.timestamps
  	end	
  end
end
