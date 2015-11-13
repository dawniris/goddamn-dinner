class RecipesController < ApplicationController
  # respond_to :html

  def new
    @recipe = Recipe.new

    # respond_to do |f|
    #   f.html {redirect_to root_path, notice: "Recipe has been created"}
    # end
  end
end