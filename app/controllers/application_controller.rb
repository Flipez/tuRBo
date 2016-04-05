class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :require_login
  before_filter :set_variables
  before_filter :set_start_time
  before_filter :set_titles

  # Capture time for calculations
  def set_start_time
    @start_time = Time.now.to_f
  end

  # Set some variables for locales
  # Fetch all categories and articles for welcome page
  # Get used tags for usage in the sidebar
  def set_variables
    I18n.locale = MySettings.locale || I18n.default_locale

    @articles = Article.all
    @categories = Category.all
    @most_used_tags = ActsAsTaggableOn::Tag.most_used(10)
  end

  # Get title according to the url
  def set_titles
    DynamicUrl.all.each do |url|
      if request.host == url.url
       @title = url.title
       @subtitle = url.subtitle
      end
    end

    # set default title if title could not be fetched
    @title ||= MySettings.title
    @subtitle ||= MySettings.subtitle
  end

  private
  
    # check if user is logged in
    def require_login
      unless logged_in?
        redirect_to login_path
      end
    end
end
