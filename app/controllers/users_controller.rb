class UsersController < ApplicationController
  def profile
  end

  def books
  	@books = Book.where(user_id: current_user.id)
  end
end
