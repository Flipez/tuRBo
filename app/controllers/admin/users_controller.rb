class Admin::UsersController < AdminController

  def index
  end
  
  def new
  end
  
  def create
    @user = User.new(user_params)
    @user.save
    redirect_to :back
  end

  def edit
    @user = User.find(params[:id])
  end

  def save
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
   
    unless @user.id == current_user.id
      flash[:danger] = 'You can only edit yourself'
      return redirect_to :back
    end

    if @user.save
      flash[:success] = 'User successfully updated'
      redirect_to :back
    else
      flash[:danger] = @user.errors.join('<br />').html_safe
      redirect_to :back
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @user.destroy
      log_out
      redirect_to root_url
    else
      flash[:danger] = 'You can only edit yourself'
      redirect_to :back
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
