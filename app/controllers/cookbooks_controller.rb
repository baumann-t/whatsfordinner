class CookbooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @user_recipes = find_user_recipes(@user)
  end

  def user_cookbook
    @user = User.find(params[:user_id])
    @user_recipes = find_user_recipes(@user)
  end

  def all_users
    if params[:query].present?
      @all_users = User.search_by_first_name_last_name(params[:query])
    else
      @all_users = User.all
    end
  end

  private

  def find_user_recipes(user)
    @user_recipes = UserRecipe.where(user_id: user.id)
  end
end
