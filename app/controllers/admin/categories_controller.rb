class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"
  def index
    @categories = Category.all
  end
  def new
    @category = Category.new 
  end
  def category_params
    params.require(:category).permit(:name)
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end

  end
end
