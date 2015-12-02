class UsersController < ApplicationController
  skip_before_filter :require_login
  
  def index
    @categories = Category.all
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @articles = Article.where(user_id: params[:id])
    @articles.each do |article|
      article.text = ActionController::Base.helpers.truncate(ActionController::Base.helpers.sanitize(article.text, tags: []), length: 100)
    end
    render template: "welcome/index"
  end

end
