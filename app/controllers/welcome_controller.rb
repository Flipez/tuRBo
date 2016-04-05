# Handle the routes targeting the welcome page
class WelcomeController < ApplicationController
  skip_before_filter :require_login
  
  # Get all articles and categories
  def index
    @articles = Article.all
    @categories = Category.all
  end
end
