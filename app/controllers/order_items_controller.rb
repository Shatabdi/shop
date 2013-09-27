class OrderItemsController < ApplicationController

	def index
		@orders = current_user.orders
	end

	def create

		@current_user_cart = current_user.cart
		@current_user_cart_items = @current_user_cart.cart_items
		@order = Order.new(:user_id => current_user.id)
		if @order.save
			@current_user_cart_items.each do |current_user_cart_item|
				@order_item = OrderItem.new(:product_id => current_user_cart_item.product_id,
				 :quantity => current_user_cart_item.quantity,
				 :price => current_user_cart_item.quantity * current_user_cart_item.product.price, :order_id => @order.id)
			end
			if @order_item.save
				redirect_to confirmation_order_item_path(@order)
			end
		end
	end

	def confirmation
		@order = Order.where(:id => params[:id]).first
	end

	def shipping_address
		@order = Order.where(:id => params[:id]).first
	end


end