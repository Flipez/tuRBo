class Admin::CommentsController < AdminController
  def index
    @comments = Comment.all
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    if Comment.where(id: params[:id]).any?
      flash[:danger] = I18n.t 'admin.delete.error'
    else
      flash[:success] = I18n.t 'admin.delete.success'
    end
    redirect_to :back
  end
end
