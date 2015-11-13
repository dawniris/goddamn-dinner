class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  # def create
  #   @index = Index.new
  # end

end