# Handle the routes targeting the categories
class CategoriesController < ApplicationController
  skip_before_filter :require_login

  # Hand over the selected category regarding the url
  # Hand over the articles which are linked to the category
  def show
    @category = Category.find(params[:id])
    @articles = @category.articles
  end

end
