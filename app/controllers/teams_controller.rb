class TeamsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_team, only: [:show, :edit, :update, :destroy]
	before_action :set_users, only: [:new, :edit]

	def index
		@teams = Team.all.order(:name)
	end

	def show
	end

	def new
		@team = Team.new
	end

	def create
		@team = Team.new(team_params)

		respond_to do |format|
			if @team.save
				format.html { redirect_to @team, notice: 'Departamento creado!' }
			else
				format.html { render :new }
			end
		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @team.update(team_params)
				format.html { redirect_to teams_path, notice: 'Departamento actualizado!' }
			else
				@error = "No se puede actualizar. #{@team.error.full_messages}"
				format.html do
					flash.now[:notice] = @error
					render :edit
				end
			end
		end
	end

	private

	# Never trust parameters from the scary internet, only allow the white list through.
	def team_params
		params.require(:team).permit(:name, :user_ids => [])
	end

	def set_team
		@team = Team.friendly.find(params[:id])
	end

	def set_users
		@users = User.left_outer_joins(:team_memberships).where( team_memberships: { id: nil } ) + @team.users
	end

end
