class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    # need to link to cookbook recipe, not individual recipe
    @user_recipe = Recipe.from_recipe_to_user_recipe(@recipe)
    redirect_to cookbook_recipe_path(@user_recipe)
  end

  def search
    if params[:query] == ""
      @user_recipes = UserRecipe.all
    else
      @user_recipes_result = UserRecipe.recipe_title_search(params[:query])

      ids = []
      @user_recipes = []

      @user_recipes_result.each do |user_recipe|
        recipe_id = user_recipe.recipe.id
        if ids.exclude?(recipe_id)
          @user_recipes.push(user_recipe)
          ids.push(recipe_id)
        end
      end
    end

    respond_to do |format|
      format.html
      format.text { render partial: 'shared/searchlist', locals: { user_recipes: @user_recipes }, formats: [:html] }
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
      redirect_to my_cookbook_path(user_recipe.user), notice: "Your recipe was created!"
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :prep_time, :instructions, :ingredients, :category, :photo, :serving_size)
  end
end
