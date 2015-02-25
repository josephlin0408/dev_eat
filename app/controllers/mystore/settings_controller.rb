class Mystore::SettingsController < ApplicationController
	def index
		@settings = Store.where(user_id: current_user.id)
	end
	def edit
		@setting = Store.find_by(id: params[:id])
	end
	def update
		@setting = Store.find_by(id: params[:id])
		if @setting.update(mystore_params)
			redirect_to mystore_settings_path
		else
			render :edit
		end
	end

	private
	def mystore_params
		params.require(:store).permit(:status, :name, :address, :zip, :tel)
	end
end