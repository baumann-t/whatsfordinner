class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    #  create globaL RECIPE
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      # create user recipe
      user_recipe = UserRecipe.create(recipe: @recipe, user: current_user)
      redirect_to my_cookbook_path(user_recipe.user), notice: "recipe was created"
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :prep_time, :instructions, :ingredients, :category)
  end
end
