class CartItemsController < ApplicationController
	def index
		@cart = Cart.where('user_id = ?',current_user.id).first
		@cart_items = @cart.cart_items
	end


	def create
		user = current_user
			product_id = params[:product_id ]
			unless CartItem.create(:cart_id => user.cart.id , :product_id => product_id.to_i)
				redirect_to root_path
			end
	end

	def destroy
		@cart_item = CartItem.where("id=?",params[:id]).first
		if @cart_item.destroy
			redirect_to cart_items_path
		end
	end
	
	def change_quantity
		@cart_item = CartItem.where("id=?",params[:id]).first
		@cart_item.update_attribute(:quantity,params[:quantity])
		redirect_to cart_items_path
	end

	def payment_confirmation
		@cart = Cart.where('user_id = ?',current_user.id).first
		@cart_items = @cart.cart_items
	end

end
