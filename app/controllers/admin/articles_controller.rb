class Admin::ArticlesController < AdminController
 
  def index
  end

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.valid? && @article.save 
      flash[:success] = I18n.t 'admin.create.success'
      redirect_to "/admin/articles/#{@article.id}"
    else
      p @article.errors.each{|x| x.to_s}
      errorlist = ""
      @article.errors.each{|k,v| errorlist += (k.to_s + " " + v.to_s + "<br />")}
      flash[:danger] = "Article invalid<br />#{errorlist}".html_safe
      render :article_new
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :back
  end
  
  def edit
    @article = Article.find(params[:id])
  end
 
  def save
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    
    if @article.save
      flash[:success] = 'Article successfully updated'
      redirect_to "/admin/articles/#{@article.id}"
    else
      flash[:danger] = @article.errors.join('<br />').html_safe
      redirect_to :back
    end
  end

  def show
    @article = Article.find(params[:id])
  end

private

  def article_params
    params.require(:article).permit(:title, :text, :category_id, :tag_list)
  end

end
