class UsersController < ApplicationController
	
	def new
        @user = User.new
        respond_to do |format|
            format.html
            format.js
        end
    end

    def edit
    	@user = User.where(:id => params[:id]).first
    end

    def create
    	@user = User.new(params[:user])
    	if @user.save
            sign_in(@user)
    		redirect_to user_path(@user)
    	else
    		render 'new'
    	end
    end

    def update
    	@user = User.where(:id => params[:id]).first
    	if @user.update_attributes(params[:user])
    		redirect_to user_path(@user)
    	else
    		render 'edit'
    	end
    end
    def show
        @user = User.where(:id => params[:id]).first
    end
end