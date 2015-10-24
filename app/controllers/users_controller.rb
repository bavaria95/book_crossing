class UsersController < ApplicationController
  def profile
  end

  def books
  	@books = Book.where(user_id: current_user.id)
  end
  def groups
  	@close_users = User.where(city: current_user.city)
  end
end
