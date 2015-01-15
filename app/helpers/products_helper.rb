module ProductsHelper
	def now_add
		unless session[:now_add].blank?
			render 'now_add'
		end
	end
end