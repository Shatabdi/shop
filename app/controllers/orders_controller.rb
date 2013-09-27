class OrdersController < ApplicationController

	def show
		@order = Order.where(:id => params[:id]).first
		@order_items =@order.order_items 
	end

	def edit
		@order = Order.where(:id => params[:id]).first
	end

	def update
		@order = Order.where(:id => params[:id]).first
		if @order.update_attributes(:shipping_address => params[:order][:shipping_address])
			redirect_to order_path(@order)
		end
	end

end