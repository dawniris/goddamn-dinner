class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_path }
    end
  end

  def create

    @category = Category.new(category_params)
### respond_to passes in a controller object indicating how the request was sent (i.e. JSON/HTML)
### hence, why the variable passed in used to be named 'controller_request_env' -- more Rails magic
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path }
      else
        format.html { render :new }
      end
    end
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end

end