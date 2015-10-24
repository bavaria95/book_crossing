class HomeController < ApplicationController
	before_action :authenticate_user!
	def index
		@shelf = Book.where.not('user_id': current_user.id)
	end

end
