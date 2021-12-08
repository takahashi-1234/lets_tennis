class AddEventDateToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_date, :date
    add_column :events, :event_deadline, :date
  end
end
