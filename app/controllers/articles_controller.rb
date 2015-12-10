class ArticlesController < ApplicationController
  skip_before_filter :require_login
  impressionist
  
  def index
    # @articles variable is load in application controller
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
  end

  def tags
    @articles = Article.tagged_with(params[:tag])
    @tag = params[:tag]
  end

  def feed
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :tag_list)
    end
end
