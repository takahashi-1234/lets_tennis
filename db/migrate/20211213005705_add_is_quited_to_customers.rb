class AddIsQuitedToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :is_quited, :boolean,default:false
  end
end
