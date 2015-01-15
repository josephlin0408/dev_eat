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
end