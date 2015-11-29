class WelcomeController < ApplicationController
  skip_before_filter :require_login


  def index
    @articles = Article.all
    
    @articles.each do |article|
      impressionist(article)
    end

    @categories = Category.all
  end
end
