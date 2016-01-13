class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create

    @category = Category.new(category_params)
### respond_to passes in a controller object indicating how the request was sent (i.e. JSON/HTML)
### hence, why the variable passed in used to be named 'controller_request_env' -- more Rails magic
    respond_to do |format|
      if @category.save
        format.html { redirect_to new_recipe_path, notice: "Tag == created" }
      else
        format.html { render :new }
      end
    end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

end