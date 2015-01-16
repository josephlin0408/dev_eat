class Superadmin::StoreCategoriesController < Superadmin::BaseController
	def index; end
	def new
		@store_categories = StoreCategory.new
	end

	private
	def store_category
		require.params(:store_categories).permit(:title, :anchor)
	end
end