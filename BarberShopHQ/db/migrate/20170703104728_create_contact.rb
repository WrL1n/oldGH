class CreateContact < ActiveRecord::Migration[5.1]
  def change
  	create_table :contacts do |t|
  		t.text :contact_name
  		t.text :contact_email
   		t.text :contact_text
   		 		
  		t.timestamps
    end


  end
end
