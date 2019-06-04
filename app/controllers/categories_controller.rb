class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end
  
 
  def new
    @category = Category.new
  end

  def create
    @category = Category.create!(category_params)

    if @category.save
      flash[:success] = "Category created!"
      redirect_to courses_path
    else
      render "new"
    end
  end

  protected

  def category_params
    params.require(:category).permit(:name)
  end
end
