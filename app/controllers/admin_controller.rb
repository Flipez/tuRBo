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
    @article.user = User.first
    if @article.save
      flash[:success] = 'Artikel wurde angelegt'
    else
      p @article.errors.each{|x| x.to_s}
    end
    redirect_to "/admin/articles/#{@article.id}"
  end
  
  def article_destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :back
  end
  
  def article_edit
    @article = Article.find(params[:id])
  end
 
  def article_save
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    if @article.save
      flash[:success] = 'Article successfully updated'
      redirect_to "/admin/articles/#{@article.id}"
    else
      flash[:error] = @article.errors.join('<br />')
      redirect_to :back
    end
  end

  def article_show
    @article = Article.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name, :password)
    end

    def article_params
      params.require(:article).permit(:title, :text)
    end
end
