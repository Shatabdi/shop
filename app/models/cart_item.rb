class CartItem < ActiveRecord::Base
  attr_accessible :quantity, :cart_id, :product_id
  belongs_to :product
  belongs_to :cart
end
