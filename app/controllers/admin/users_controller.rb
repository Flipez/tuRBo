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
   
    unless @user.id == current_user.id
      flash[:danger] = 'You can only edit yourself'
      return redirect_to :back
    end
    
    @user.update_attributes(user_params)

    if @user.save
      flash[:success] = 'User successfully updated'
      redirect_to :back
    else
      flash[:danger] = @user.errors.full_messages.to_sentence
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
    params.require(:user).permit(:name, :password, :image_url, :job, :avatar, :remote_avatar_url, :remove_avatar)
  end

end
