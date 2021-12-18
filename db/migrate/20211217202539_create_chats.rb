class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :customer_id,null:false
      t.integer :room_id,null:false
      t.integer :circle_id,null:false
      t.string :message,null:false

      t.timestamps
    end
  end
end
