class AboutController < ApplicationController
  skip_before_filter :require_login
  def index
    @categories = Category.all
  end

end
