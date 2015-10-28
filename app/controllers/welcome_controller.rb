class WelcomeController < ApplicationController
  skip_before_filter :require_login
  
  def index
    @articles = Article.all
    @categories = Category.all
  end
end
