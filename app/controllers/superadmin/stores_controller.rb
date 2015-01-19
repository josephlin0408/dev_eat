class Superadmin::StoresController < Superadmin::BaseController
	before_action :required_store!, only: [:show, :edit, :update]
	def index
		@stores = Store.all
	end
	def new
		@store = Store.new
	end
	def create
		@store = Store.new(store_params)
		if @store.save
			redirect_to superadmin_stores_path
		else
			render :new
		end
	end
	def edit; end

	def update
		if @store.update(store_params)
			redirect_to superadmin_store_path(params[:id])
		else
			render :edit
		end
	end
	def show
		# 因為在商家頁時,會有新增產品的需求, 所以用一個session去記住現在是哪間商家.
		session[:sid] = @store.id
		@products = StoreProduct.where(store_id: params[:id])
	end

	private
	def store_params
		params.require(:store).permit(:name, :owner_user, :address, :zip, :tel, :power, :status)
	end
end