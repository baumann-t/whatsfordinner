class UpvotesController < ApplicationController
  def create
    @upvote = Upvote.new
    @upvote.user = current_user
    @recipe = Recipe.find(params[:id])
    @upvote.recipe = @recipe
  end
end
