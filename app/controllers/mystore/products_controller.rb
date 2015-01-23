class Mystore::ProductsController < ApplicationController
	def show
		session[:sid] = params[:id]
		@products = StoreProduct.where(store_id: params[:id])
	end
	def new
		@product = StoreProduct.new
		@category = StoreCategory.all
	end
	def create
		@product = StoreProduct.new(product_params)
		@category = StoreCategory.all
		if @product.save
			flash[:notice] = "#{@product.name}Save"
			redirect_to new_mystore_product_path
		else
			render :new
		end
	end

	private
	def product_params
		params.require(:store_product).permit(:store_id, :name, :price, :desc, :category)
	end
end