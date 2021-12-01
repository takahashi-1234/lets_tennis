class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer:customer_id,null:false
      t.integer:court_id,null:false
      t.string:report_content,null:false
      t.text:report_detail
      t.timestamps
    end
  end
end
