class Admin::ArticlesController < AdminController
 
  def index
  end

  def new
  end

  # Validate new article and save it in model
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    
    if @article.valid? && @article.save 
      flash[:success] = I18n.t 'admin.create.success'
      redirect_to "/admin/articles/#{@article.id}/edit"
    else
      flash[:danger] = @article.errors.full_messages.to_sentence
      render :new
    end
  end
  
  # Remove article from model
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :back
  end
  
  # Load specified article for editing
  def edit
    @article = Article.find(params[:id])
  end
 
  # Save article in model
  def save
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    
    if @article.save
      flash[:success] = 'Article successfully updated'
      redirect_to "/admin/articles/#{@article.id}/edit"
    else
      flash[:danger] = @article.errors.full_messages.to_sentence
      redirect_to :back
    end
  end

  # Load specific article for display
  def show
    @article = Article.find(params[:id])
  end

private

  # Restrict parameters from POST
  def article_params
    params.require(:article).permit(:title, :text, :category_id, :tag_list, :url, :hidden, :header)
  end

end
