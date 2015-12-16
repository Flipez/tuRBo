include ActionView::Helpers::DateHelper

#TODO: Split this up to subcontrollers

class AdminController < ApplicationController
  
  before_filter :set_up_variables

  def set_up_variables
    @articles = Article.all
    @users = User.all
    @categories = Category.all
  end
  
  def index
    @uptime = time_ago_in_words(Blog::BOOTET_AT)

    @gems = {}
    Bundler.load.specs.map do |spec| 
      @gems[spec.name] = spec.version.to_s
    end
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

  def user_edit
    @user = User.find(params[:id])
  end

  def user_save
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
   
    unless @user.id == current_user.id
      flash[:danger] = 'You can only edit yourself'
      return redirect_to :back
    end

    if @user.save
      flash[:success] = 'User successfully updated'
      redirect_to :back
    else
      flash[:danger] = @user.errors.join('<br />').html_safe
      redirect_to :back
    end
  end
  
  def user_destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.destroy
      log_out
      redirect_to root_url
    else
      flash[:danger] = 'You can only edit yourself'
      redirect_to :back
    end
  end

  ## Article

  def article_index
  end

  def article_new
  end

  def article_create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.valid? && @article.save 
      flash[:success] = I18n.t 'admin.create.success'
      redirect_to "/admin/articles/#{@article.id}"
    else
      p @article.errors.each{|x| x.to_s}
      errorlist = ""
      @article.errors.each{|k,v| errorlist += (k.to_s + " " + v.to_s + "<br />")}
      flash[:danger] = "Article invalid<br />#{errorlist}".html_safe
      render :article_new
    end
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
      flash[:danger] = @article.errors.join('<br />').html_safe
      redirect_to :back
    end
  end

  def article_show
    @article = Article.find(params[:id])
  end

  ## Category

  def category_index
  end

  def category_new
  end

  def category_create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = I18n.t 'admin.create.success'
    else
      p @category.errors.each{|x| x.to_s}
    end
    redirect_to "/admin/categories"
  end

  def category_destroy
    @category = Category.find(params[:id])
    @category.destroy
    if Category.where(id: params[:id]).any?
      flash[:danger] = I18n.t 'admin.delete.error'
    else
      flash[:success] = I18n.t 'admin.delete.success'
    end
    redirect_to :back
  end

  def comment_index
    @comments = Comment.all
  end

  def comment_destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    if Comment.where(id: params[:id]).any?
      flash[:danger] = I18n.t 'admin.delete.error'
    else
      flash[:success] = I18n.t 'admin.delete.success'
    end
    redirect_to :back
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :password)
    end

    def article_params
      params.require(:article).permit(:title, :text, :category_id, :tag_list)
    end
    
    def category_params
      params.require(:category).permit(:name)
    end
end
