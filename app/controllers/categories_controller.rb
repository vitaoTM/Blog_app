class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category created"
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
       flash[:notice] = "Category name updated successfully"
       redirect_to @category
    else
      render 'edit'
    end
  end

  def index
    @show_search = true
    @q = Category.ransack(params[:q])
    @categories = @q.result.paginate(page: params[:page], per_page: 5)

  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only Admins can perform this action"
      redirect_to categories_path
    end
  end

end
