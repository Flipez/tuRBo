# Handle the error pages
class ErrorsController < ApplicationController
  skip_before_filter :require_login
  
  # Render 404 error page
  def not_found
    render(status: 404)
  end

  # Render 500 error page
  def internal_server_error
    render(status: 500)
  end
end
