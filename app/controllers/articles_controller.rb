class ArticlesController < ApplicationController
  skip_before_filter :require_login
  impressionist
  
  def index
  end

  def show
    @article = Article.find(params[:id])
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

end
