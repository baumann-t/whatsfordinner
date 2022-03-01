class CookbooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @user_recipes = UserRecipe.where(user_id: @user.id)
  end
end
