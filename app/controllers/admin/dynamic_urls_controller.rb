class Admin::DynamicUrlsController < AdminController
 
  def create
    p 'create'
    @dynamic_url = DynamicUrl.new(dynamic_url_params)
    if @dynamic_url.valid? && @dynamic_url.save 
      flash[:success] = I18n.t 'admin.create.success'
      redirect_to :back
    else
      flash[:danger] = @dynamic_url.errors.full_messages.to_sentence
      redirect_to :back
    end
  end
  
  def destroy
    @dynamic_url = DynamicUrl.find(params[:id])
    @dynamic_url.destroy
    redirect_to :back
  end
  
private

  def dynamic_url_params
    params.require(:dynamic_url).permit(:title, :subtitle, :url)
  end

end
