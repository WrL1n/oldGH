class CreateComment < ActiveRecord::Migration[5.1]
  def change
  	create_table :comments do |t|
  		# Будут созданы столбцы с типом text и названиями [name,phone и т.д.]
  		t.integer :post_id
  		t.text :comment_text
   		t.text :comment_author		  		

  		# Создает 2 столбца: created_at (дата создания) и update_at (дата обновления)
  		t.timestamps
  	end	
  end
end
