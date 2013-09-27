class PasswordResetsController < ApplicationController

  def new
  end

  def create
  	user = User.where(:email => params[:email]).first
  	if user.present?
  		user.reset_password_token
  		Notify.send_token(user.email, user.password_reset_token).deliver
  		redirect_to root_path
  		#email
  	else
  		redirect_to request.referer, :notice => "your email id is invalid"
  	end
  end

  def password_change
  	puts params.inspect
  	@user = User.where(:password_reset_token => params[:id]).first
  	unless @user.present?
  		redirect_to root_path
  	end
  end

  def password_changed
  	puts params.inspect
  	@user = User.where(:id => params[:id]).first
  	if @user.present?
  		if @user.update_attributes(params[:user])
  			redirect_to user_path(@user)
  		else
  			render 'password_change'
  		end
  	else
  		redirect_to root_path
  	end
  end

end
