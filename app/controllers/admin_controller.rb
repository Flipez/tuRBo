class AdminController < ApplicationController
  
  before_filter :set_up_variables

  # Set up instance variables from models
  # @param none
  # @return [Object] 
  def set_up_variables
    @articles = Article.all
    @users = User.all
    @categories = Category.all
  end
 
  # Select layout for admin interface
  layout 'admin'
    
end
