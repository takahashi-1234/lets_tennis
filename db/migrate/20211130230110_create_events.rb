class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer:circle_id,null:false
      t.string:title,null:false
      t.string:body,null:false

      t.timestamps
    end
  end
end
