class RecipesController < ApplicationController

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
        format.html { redirect_to recipes_path, notice: "Recipe == created" }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @recipe = Recipe.first
  end

  def edit
    @recipe = Recipe.first
  end

  def update
    @recipe = Recipe.first

    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html {redirect_to recipes_path, notice: 'Recipe == updated'}
      else
        format.html {render :edit}
      end
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name)
  end

end