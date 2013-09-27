class AddProductIdAndUserIdToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :product_id, :integer
    add_column :carts, :user_id, :integer
  end
end
