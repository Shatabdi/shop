module SessionsHelper
	def sign_in(user)
		cookies.permanent.signed[:remember_token] = [user.id, user.salt]
		current_user = user
		check_cart(current_user)
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		current_user.cart.destroy unless current_user.cart.blank?
		cookies.delete(:remember_token)
		current_user = nil
		session[:user_cart_id] = nil
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= user_from_remember_token
	end
	
	 def check_cart(user)
			
				session_id = Time.now.to_s
				session[:user_cart_id] ||= user.create_cart(:session_id => session_id)
		
	end

	private

		def user_from_remember_token
			User.authenticate_with_salt(*remember_token)
		end
		def remember_token
			cookies.signed[:remember_token] || [nil, nil]
		end
end
