class ProductsController < ApplicationController

	before_filter :check_category, :only => [:index, :edit, :update, :destroy]
	before_filter :check_product, :only => [:edit, :update, :show, :destroy]

	def index
		@categories = Category.all
		@selected_category = Category.where(:id => params[:category_id]).first
		@products = @category.products
	end

	def new
		@category = Category.where(:id => params[:category_id]).first
		@product = Product.new
	end

	def create
		@category = Category.where(:id => params[:category_id]).first
		@product = @category.products.new(params[:product])
		if @product.save
			redirect_to category_product_path(@category, @product)
		else
			render 'new'
		end
	end

	def edit
		@category = Category.where(:id => params[:category_id]).first
		@product = @category.products.where(:id => params[:id]).first
	end

	def update
		@category = Category.where(:id => params[:category_id]).first
		@product = @category.products.where(:id => params[:id]).first
		if @product.update_attributes(params[:product])
			redirect_to category_products_path(@category)
		else
			render 'edit'
		end
	end

	def show
		@category = Category.where(:id => params[:category_id]).first
		@product = @category.products.where(:id  => params[:id]).first
	end

	def destroy
		@category = Category.where(:id => params[:category_id]).first
		@product = @category.products.where(:id => params[:id]).first
		if @product.destroy
			redirect_to category_products_path(@category)
		end
	end

	protected

	def check_category
		@category = Category.where(:id => params[:category_id])
		if @category.blank?
			redirect_to category_products_path(@category, @product)
		end 
	end

	def check_product
		@product = Product.where(:id => params[:id])
		if @product.blank?
			redirect_to category_products_path(@category, @product)
		end
	end

end
