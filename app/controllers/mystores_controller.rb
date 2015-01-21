class MystoresController < ApplicationController
	def list
		#先找出這個使用者對應的商家有誰
		@a = Store.where(user_id: current_user.id)
	end
end