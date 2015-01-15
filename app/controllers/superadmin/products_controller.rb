class Superadmin::ProductsController < Superadmin::BaseController
	def new
		@products = Product.where(store_id: session[:sid])
		@product = Product.new
	end
	def create
		@product = Product.new(product_params)
		if @product.save
			flash[:notice] = "#{@product.name}Save"
			redirect_to new_superadmin_product_url
		else
			flash[:notice] = "Warning"
			redirect_to new_superadmin_product_url
		end
	end
	private
	def product_params
		params.require(:product).permit(:store_id, :name, :price, :desc)
	end
end