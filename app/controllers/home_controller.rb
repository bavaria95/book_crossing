class HomeController < ApplicationController
	def index
		@shelf = Book.all
	end

end
