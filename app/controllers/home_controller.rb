class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
		city = current_user.city
		users_in_city = User.where(:city => current_user.city).where.not(:id => current_user.id)
		@shelf = []
		users_in_city.each do |u|
			@shelf += Book.where(:user_id => u.id)
		end
	end

end
