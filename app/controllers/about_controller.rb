class AboutController < ApplicationController

  def index
    @categories = Category.all
  end

end
