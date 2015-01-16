class Superadmin::StoreCategoriesController < Superadmin::BaseController
	def index; end
	def new
		@store_categories = StoreCategory.new
	end
	def create
		@store_category = StoreCategory.new(store_category)
		if @store_category.save
			flash[:notice] = "#{@store_category.title}Save"
			redirect_to superadmin_store_categories_path
		else
			flash[:notice] = "#{@store_category.title} Error"
			redirect_to superadmin_store_categories_path
		end
	end

	private
	def store_category
		params.require(:store_category).permit(:store_id, :title, :anchor)
	end
end