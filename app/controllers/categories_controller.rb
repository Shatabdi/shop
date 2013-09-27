class CategoriesController < ApplicationController
	before_filter :check_category, :only => [:show, :edit, :update, :destroy]
	def index
		@category = Category.all
	end
	def show
		@category = Category.where(:id => params[:id]).first
	end
	def new
		@category = Category.new
	end
	def edit
		@category = Category.where(:id => params[:id]).first
	end
	def create
		@category = Category.new(params[:category])
		if @category.save
			redirect_to root_path
		else
			render 'new'
		end
	end
	def update
		@category = Category.where(:id => params[:id]).first
		if @category.update_attributes(params[:category])
			redirect_to root_path
		else
			render 'edit'
		end
	end
	def destroy
		@category = Category.where(:id => params[:id]).first
		if @category.destroy
			redirect_to root_path
		end
	end
	protected
	def check_category
		@category = Category.where(:id => params[:id])
		if @category.blank?
			redirect_to root_path
		end
	end
end
