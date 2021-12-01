class CreateCircles < ActiveRecord::Migration[5.2]
  def change
    create_table :circles do |t|
      t.integer:customer_id,null:false
      t.integer:court_id,null:false
      t.string:level,null:false
      t.string:circle_name,null:false
      t.string:leader_name,null:false
      t.text:body,null:false
      t.string:member,null:false
      t.string:email,null:false

      t.timestamps
    end
  end
end
