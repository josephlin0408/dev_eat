class Superadmin::ProductsController < Superadmin::BaseController
	def index
		session[:now_add] = nil
		@products = Product.where(store_id: session[:sid])
	end
	def new
		@product = Product.new
	end
	def create
		if session[:now_add].blank?
			session[:now_add] =[]
		end
		@product = Product.new(product_params)
		if @product.Save
			flash[:notice] = "#{@product.name} Save"
			redirect_to new_superadmin_product_url
			session[:now_add] << @product
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