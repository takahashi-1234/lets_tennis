class CreateCourts < ActiveRecord::Migration[5.2]
  def change
    create_table :courts do |t|
      t.integer:customer_id,null:false
      t.string:name,null:false
      t.string:address,null:false
      t.float:latitude,null:false
      t.float:longitude,null:false
      t.string:operation,null:false
      t.string:court_kind,null:false
      t.string:price,null:false

      t.timestamps
    end
  end
end
