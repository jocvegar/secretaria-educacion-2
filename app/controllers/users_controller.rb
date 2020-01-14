class UsersController < ApplicationController
	# before_action :authenticate_user!
	before_action :set_user, only: [:destroy, :edit, :update]

	def index
		@users = User.all.order(:first_name)
	end

	def edit
	end

	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to users_path, notice: 'Usuario actualizado!' }
			else
				@error = "No se puede actualizar. #{@user.errors.full_messages}"
				format.html do
					flash.now[:notice] = @error
					render :edit
				end
			end
		end
	end

	def destroy
		@user.destroy
		respond_to do |format|
			format.html { redirect_to users_path, notice: 'Usuario borrado!' }
			format.js
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_user
		@user = User.friendly.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
	end
end
