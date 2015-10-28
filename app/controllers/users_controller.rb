class UsersController < ApplicationController
  skip_before_filter :require_login
  def index
    @categories = Category.all
    @users = User.all
  end

end
