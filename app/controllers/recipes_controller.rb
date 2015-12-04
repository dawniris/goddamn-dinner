class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |controller_request_env|
      if @recipe.save
        controller_request_env.html { redirect_to recipes_path, notice: "Congrats, recipe" }
      else
        controller_request_env.html { render :new }
      end
    end
  end

  def show
    @recipe = Recipe.first
  end


  private

  def recipe_params
    params.require(:recipe).permit(:name)
  end

end