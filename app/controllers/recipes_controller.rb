class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
### respond_to passes in a controller object indicating how the request was sent (i.e. JSON/HTML)
### hence, why the variable passed in used to be named 'controller_request_env' -- more Rails magic

    respond_to do |format|
      if @recipe.save
        @recipe.category_ids = params[:recipe][:category_ids]
        format.html { redirect_to recipes_path, notice: "Recipe == created" }
      else
        format.html { render :new }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    @recipe.category_ids = params[:recipe][:category_ids]

    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipes_path, notice: 'Recipe == updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_path, notice: 'Recipe == deleted' }
    end
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :infobox)
    end
end