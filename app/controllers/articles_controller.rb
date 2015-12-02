class ArticlesController < ApplicationController
  skip_before_filter :require_login

  impressionist
  
  def index
    # @articles variable is load in application controller
  end

  def show
    @article = Article.find(params[:id])
    @categories = []
    categories = ActsAsTaggableOn::Tagging.includes(:tag).where(context: 'categories')
    categories.map do |tagging| 
      @categories <<  ActsAsTaggableOn::Tag.find(tagging.tag_id)
    end.uniq
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to @article
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
