class CategoriesController < ApplicationController
  skip_before_filter :require_login

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles
  end

end
