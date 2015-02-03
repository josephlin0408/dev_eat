class StoresController < ApplicationController	
	before_action :required_store!, only: [:show]
	before_action :login_required, only: [:take]
	def index
		@stores = Store.all
	end
	def show
		@store = Store.find_by(id: params[:id])
		@products = StoreProduct.where(store_id: params[:id])
	end
	def take
		#先判斷是否登入, 先判斷這筆資料是否已經存在, 如果存在則不寫入.
		@check = StoreTake.find_by(user_id: current_user.id, store_id: params[:id])
		unless @check.blank?
			flash[:notice] = "你已申請過領回, 站方人員將會盡快與您聯繫, 或直接來信告知站方"
			redirect_to store_path(params[:id]) and return
		end
		@take_info = StoreTake.new(user_id: current_user.id, store_id: params[:id], status: '1')
		@take_info.save
		flash[:notice] = "已送出申請, 站方人員將會與您聯繫"
		redirect_to store_path(params[:id])
	end
end
