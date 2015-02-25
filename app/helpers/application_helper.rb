module ApplicationHelper
	def get_menu
	  if user_signed_in? 
	  	if current_user.store?
	  		render 'common/store_navtop'
	  	else
	  		render 'common/navtop'
	  	end
	  else
	  	link_to 'login', new_user_session_path 
	  end
	end

	def check_payment
		@store = Store.find(session[:sid])
		if @store.power_cd?
			render 'mystore/products/paymentnew'
		else
			render 'mystore/products/notpaymentnew'
		end
	end
end