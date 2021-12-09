class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer:circle_id,null:false
      t.integer:customer_id,null:false
      t.text:comment,null:false
      t.float:evaluation,null:false
      t.timestamps
    end
  end
end
