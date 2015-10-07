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

  ## Article

  def article_index
  end

  def article_new
  end

  def article_create
    @article = Article.new(article_params)
    @article.save
    flash[:success] = 'Artikel wurde angelegt'
    redirect_to :back
  end

  private
    def user_params
      params.require(:user).permit(:name, :password)
    end

    def article_params
      params.require(:article).permit(:title, :text)
    end
end
