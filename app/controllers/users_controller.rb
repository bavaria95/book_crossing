class UsersController < ApplicationController
  before_filter :authenticate_user!

  def profile
  end

  def books
  	@books = current_user.books
  end

  def groups
  	@close_users = User.where(:city => current_user.city).where.not(:id => current_user.id)
  end
end
