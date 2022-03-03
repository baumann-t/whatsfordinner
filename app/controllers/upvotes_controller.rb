class UpvotesController < ApplicationController
  def create
    @upvote = Upvote.new
    @upvote.user = current_user
    @recipe = Recipe.find(params[:id])
    @upvote.recipe = @recipe

    respond_to do |format|
      if @upvote.save
        upvote = { upvote_count: @recipe.upvotes.count }
        format.json { render :json => upvote }
        @recipe.upvotes_tracker += 1
        @recipe.save
      end
    end
  end
end
