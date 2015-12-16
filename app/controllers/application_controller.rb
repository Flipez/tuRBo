class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :require_login

  before_filter :set_variables

  before_filter :set_start_time

  def set_start_time
    @start_time = Time.now.to_f
  end


  def set_variables
    @articles = Article.all
    @categories = Category.all
    @most_used_tags = ActsAsTaggableOn::Tag.most_used(10)
  end

  private
   
    def require_login
      unless logged_in?
        redirect_to login_path
      end
    end
end
