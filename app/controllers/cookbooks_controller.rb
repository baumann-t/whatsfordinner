class CookbooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @user_recipes = find_user_recipes(@user)
  end

  def top_ten
    @user = params[:user_id] ? User.find(params[:user_id]) : current_user
    @top_recipes = @user.recipes.where("upvotes_tracker > 0").order(upvotes_tracker: :desc)
  end

  def user_cookbook
    @user = User.find(params[:user_id])
    @user_recipes = find_user_recipes(@user)
  end

  def user_search
    if params[:query] == ""
      @all_users = User.all
    else
      @all_users = User.search_by_first_name_last_name(params[:query])
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'shared/usersearch', locals: { users: @all_users }, formats: [:html] }
    end
  end

  def add
    @user_recipe = UserRecipe.new
  end

  def create
    @user_recipe = UserRecipe.where(recipe_id: params[:recipe_id], user_id: current_user.id).first

    if @user_recipe.update(wishlisted: false, user_comment: params[:user_recipe][:user_comment])
      FeedItem.create(user_id: current_user.id, user_recipe_id: @user_recipe.id, item_type: "added")
      redirect_to my_cookbook_path
    else
      render 'cookbooks/add'
    end
  end

  def show
    @user_recipe = UserRecipe.find(params[:user_recipe_id])
    @cookbook_user = @user_recipe.user
    @current_user = current_user
    @recipe = @user_recipe.recipe
    @recipe_author = @recipe.user
  end

  def show_search
    @user_recipe = UserRecipe.find(params[:user_recipe_id])
    @cookbook_user = @user_recipe.user
    @current_user = current_user
    @recipe = @user_recipe.recipe
    @recipe_author = @recipe.user
  end

  def destroy
    @user_recipe = find_user_recipe
    if UserRecipe.destroy(@user_recipe.id)
      redirect_to(my_cookbook_path)
    end
  end

  def mark_cooked
    @user_recipe = find_user_recipe
    @user_recipe.mark_as_cooked!
    if @user_recipe.save!
      FeedItem.create(item_type: "cooked", user_id: current_user.id, user_recipe_id: @user_recipe.id)
      redirect_to(my_cookbook_path)
    end
  end

  def add_wishlist
    @original_user_recipe = UserRecipe.find(params[:user_recipe_id])
    @recipe = @original_user_recipe.recipe
    @user_recipe = UserRecipe.new(wishlisted: true)
    @user_recipe.recipe = @recipe
    @user_recipe.user = current_user

    if @user_recipe.save
      FeedItem.create(item_type: "wishlisted", user_id: current_user.id, user_recipe_id: @user_recipe.id)
      redirect_to my_wishlist_path
    end
  end

  def wishlist_view
    @user_recipe = UserRecipe.find(params[:user_recipe_id])
    @recipe = @user_recipe.recipe
    @recipe_author = @recipe.user
  end

  def my_wishlist_recipe
    @user_recipe = UserRecipe.find(params[:user_recipe_id])
  end

  def my_history
    @user = current_user
    @cooking_history = @user.user_recipes.where(cooked: true)
  end

  def my_wishlist
    @user = current_user
    @wishlist = @user.user_recipes.where(wishlisted: true).order(created_at: :desc)
  end

  def remove_wishlist
    @user_recipe = UserRecipe.find(params[:user_recipe_id])
    @user_recipe.wishlisted = false

    if @user_recipe.save
      redirect_to my_wishlist_path
    end
  end

  def newsfeed_view
    @user_recipe = UserRecipe.find(params[:user_recipe_id])
    @cookbook_user = @user_recipe.user
    @current_user = current_user
    @recipe = @user_recipe.recipe
    @recipe_author = @recipe.user
  end

  private

  def find_user_recipe
    @user_recipe = UserRecipe.where(user_id: current_user.id, recipe_id: params[:recipe_id]).first
  end

  def find_user_recipes(user)
    @user_recipes = UserRecipe.where(user_id: user.id, wishlisted: [false, nil]).order(created_at: :desc)
  end

  def user_recipe_params
    params.require(:user_recipe).permit(:user_comment)
  end
end
