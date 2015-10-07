class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
        #dinge
        log_in user
        redirect_to controller: :admin, action: :index
    else
        flash.now[:danger] = 'Invalid username/password combination' 
        render 'new'
    end
  end

  def destroy
  end
end
