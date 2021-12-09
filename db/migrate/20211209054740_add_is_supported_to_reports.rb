class AddIsSupportedToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :is_supported, :boolean, default:false
  end
end
