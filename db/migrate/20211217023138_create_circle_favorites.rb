class CreateCircleFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :circle_favorites do |t|
      t.integer:customer_id,null:false
      t.integer:circle_id,null:false
      t.timestamps
    end
  end
end
