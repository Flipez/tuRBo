# Handles the routes targeting the about page
class AboutController < ApplicationController
  skip_before_filter :require_login
  
  # Hand over all categories
  def index
    @categories = Category.all
  end

end
