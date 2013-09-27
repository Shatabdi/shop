class RemoveUniqueIdFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :unique_id
  end

  def down
    add_column :orders, :unique_id, :text
  end
end
