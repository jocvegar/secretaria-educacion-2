class UsersController < ApplicationController
	# before_action :authenticate_user!
	before_action :set_user, only: [:destroy]

	def index
		@users = User.all.order(:first_name)
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
		@user = User.find(params[:id])
	end
end
