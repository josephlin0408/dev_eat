class Superadmin::StoreProductsController < Superadmin::BaseController
	def index
		session[:now_add] = nil
		@store_products = StoreProduct.where(store_id: session[:sid])
	end
	def new
		@store_product = StoreProduct.new
	end
	def create
		if session[:now_add].blank?
			session[:now_add] =[]
		end
		@store_product = StoreProduct.new(product_params)
		if @store_product.save
			flash[:notice] = "#{@store_product.name}Save"
			redirect_to new_superadmin_store_product_url
			session[:now_add] << @store_product
		else
			flash[:notice] = "Warning"
			redirect_to new_superadmin_store_product_url
		end
	end

	private
	def product_params
		params.require(:store_product).permit(:store_id, :name, :price, :desc)
	end
end


