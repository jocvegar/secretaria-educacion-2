class HomeController < ApplicationController
	def index
		@user_size = User.all.size
	end
end
