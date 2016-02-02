class CommentsController < ApplicationController
  skip_before_filter :require_login
  
  def create
    article = Article.find(params[:id])
    comment = Comment.new(comment_params)

    if is_valid?(comment) && comment.save
      flash[:success] = I18n.t 'comment.create.success'
      article.comments << comment
      article.save!
    else
      flash[:danger] = I18n.t 'comment.create.error' unless flash[:danger]
    end
    redirect_to :back
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :text)
    end

    def is_valid? comment
      if MySettings.enable_recaptcha
        return false unless verify_recaptcha(model: comment)
        flash[:danger] = I18n.t 'comment.create.wrong_recaptcha'
      end
      comment.valid?
    end
end
