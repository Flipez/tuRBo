class CommentsController < ApplicationController
  skip_before_filter :require_login
  
  def create
    article = Article.find(params[:id])
    comment = Comment.new(comment_params)
    p article
    if comment.valid? && verify_recaptcha(model: comment) && comment.save
      flash[:success] = I18n.t :comment_create_success
      article.comments << comment
      article.save!
    else
      flash[:danger] = I18n.t :comment_create_error
    end
    redirect_to :back
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :text)
    end
end
