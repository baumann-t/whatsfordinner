class UpvotesController < ApplicationController
  def create
    @upvote = Upvote.new
    @upvote.user = current_user
    @recipe = Recipe.find(params[:id])
    @upvote.recipe = @recipe

    if @upvote.save
      upvote_tracker(@recipe)
      respond_to do |format|
        upvote = { upvote_count: @recipe.upvotes.count }
        format.json { render :json => upvote }
      end
    end
  end

  def delete
    @upvote = Upvote.where(user_id: current_user.id, recipe_id: params[:id]).first
    @recipe = Recipe.find(params[:id])
    if @upvote.delete
      @recipe.upvotes_tracker -= 1
      respond_to do |format|
        upvote = { upvote_count: @recipe.upvotes.count }
        format.json { render :json => upvote }
      end
    end
  end

  def upvote_tracker(recipe)
    if recipe.upvotes_tracker.nil?
      recipe.upvotes_tracker = 1
    else
      recipe.upvotes_tracker += 1
    end
    recipe.save
  end
end
