class UsersController < ApplicationController
  skip_before_filter :require_login
  
  def index
    @categories = Category.all
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @articles = Article.where(user_id: params[:id])
  end

end
