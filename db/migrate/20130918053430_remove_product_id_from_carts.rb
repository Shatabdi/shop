class RemoveProductIdFromCarts < ActiveRecord::Migration
  def up
    remove_column :carts, :product_id
  end

  def down
    add_column :carts, :product_id, :integer
  end
end
