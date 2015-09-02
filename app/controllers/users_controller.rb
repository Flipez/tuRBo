class UsersController < ApplicationController

  def index
    @categories = Category.all
    @users = User.all
  end

end
