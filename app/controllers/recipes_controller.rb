class RecipesController < ApplicationController
  def show
    # @recipe = Recipe.find(params[:id])
    # need to link to cookbook recipe, not individual recipe
  end

  def index
    if params[:query].present?
      @recipes = Recipe.search_by_title(params[:query])
    else
      @recipes = Recipe.all
    end
  end

  def my_recipes
    @my_recipes = Recipe.where(user: current_user)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
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
