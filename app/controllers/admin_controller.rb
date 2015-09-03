class AdminController < ApplicationController
  
  before_filter :set_up_variables

  def set_up_variables
    @articles = Article.all
    @users = User.all
    @categories = Category.all
  end
  
  def index
  end

  # Actions for User handling in admin panel
  def user_index
  end
  
  def user_new
  end
  
  def user_create
    @user = User.new(user_params)
    @user.save
    redirect_to :back
  end

  def user_show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :password)
    end
end
