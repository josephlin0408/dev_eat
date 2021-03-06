class Superadmin::StoreProductsController < Superadmin::BaseController
	def index
		session[:now_add] = nil
		@store_products = StoreProduct.where(store_id: session[:sid])
	end
	def new
		@store_product = StoreProduct.new
		@store_category = StoreCategory.all
	end
	def create
		if session[:now_add].blank?
			session[:now_add] =[]
		end
		@store_product = StoreProduct.new(product_params)
		@store_category = StoreCategory.all
		if @store_product.save
			flash[:notice] = "#{@store_product.name}Save"
			redirect_to new_superadmin_store_product_url
			session[:now_add] << @store_product
		else
			render :new
			#redirect_to new_superadmin_store_product_url
		end
	end

	private
	def product_params
		params.require(:store_product).permit(:store_id, :name, :price, :desc, :category)
	end
end