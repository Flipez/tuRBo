class SessionsController < ApplicationController
  skip_before_filter :require_login
  def new
  end

  # take params, verify and create new session
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to controller: 'admin/index', action: :index
    else
        flash.now[:danger] = 'Invalid username/password combination' 
        render 'new'
    end
  end

  # destroy the session
  def destroy
    log_out
    redirect_to root_url
  end
end
