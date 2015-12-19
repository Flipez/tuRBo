class Admin::CategoriesController < AdminController

  def index
  end

  def new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = I18n.t 'admin.create.success'
    else
      p @category.errors.each{|x| x.to_s}
    end
    redirect_to "/admin/categories"
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    if Category.where(id: params[:id]).any?
      flash[:danger] = I18n.t 'admin.delete.error'
    else
      flash[:success] = I18n.t 'admin.delete.success'
    end
    redirect_to :back
  end

private

  def category_params
    params.require(:category).permit(:name)
  end

end
