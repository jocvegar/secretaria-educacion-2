class TeamsController < ApplicationController

	def index
		@teams = Team.all.order(:name)
	end

end
