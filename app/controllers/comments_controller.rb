class CommentsController < ApplicationController
  skip_before_filter :require_login
  
  def create
    article = Article.find(params[:id])
    comment = Comment.new(comment_params)
    if comment.valid?
      if comment.save
        flash[:success] = I18n.t :comment_create_success
        article.comments << comment
        article.save!
      else
        flash[:danger] = I18n.t :comment_create_error
      end
    end
    redirect_to :back
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :text)
    end
end
