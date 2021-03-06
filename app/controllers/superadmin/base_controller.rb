class Superadmin::BaseController < ApplicationController
	#要操作superadmin內的所有controller都需要先驗證, 且帳號要有admin的權限
	before_action :login_required, :required_admin! 
	def required_admin!
    redirect_to root_url, notice: '你沒有 admin 權限' unless current_user && current_user.admin?
  end
  def required_store!
  	@store = Store.find_by(id: params[:id])
  	redirect_to superadmin_stores_path, notice: '沒有這筆商家存在' unless @store.present?
  end
end