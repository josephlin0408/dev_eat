module ApplicationHelper
	def get_menu
	  if user_signed_in?
	  	if current_user.store?
	  		render 'common/store_menu'
	  	else
	  		render 'common/menu'
	  	end
	  else
			link_to 'login', new_user_session_path 
	  end
	end
end