class HomeController < ApplicationController
	def index
		@user_size = User.all.size
		@package_size = Package.on_going.size
		@finished_package_size = Package.finished.size
	end
end
