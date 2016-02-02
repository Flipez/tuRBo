class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :require_login
  before_filter :set_variables
  before_filter :set_start_time
  before_filter :set_titles

  def set_start_time
    @start_time = Time.now.to_f
  end


  def set_variables
    @articles = Article.all
    @categories = Category.all
    @most_used_tags = ActsAsTaggableOn::Tag.most_used(10)
  end

  def set_titles
    DynamicUrl.all.each do |url|
      if request.host == url.url
       @title = url.title
       @subtitle = url.subtitle
      end
    end

    @title ||= MySettings.title
    @subtitle ||= MySettings.subtitle
  end

  private
   
    def require_login
      unless logged_in?
        redirect_to login_path
      end
    end
end
