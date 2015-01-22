class Mystore::SettingsController < ApplicationController
	def index
		@settings = Store.all
	end
	def edit
		@setting = Store.find_by(id: params[:id])
	end

	private
	def mystore_params
		params.require(:mystore).permit(:name, :user_id, :address, :zip, :tel, :power, :status)
	end
end