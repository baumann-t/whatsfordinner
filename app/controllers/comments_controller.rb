class CommentsController < ApplicationController
  def create
    binding.pry
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new(content: params[:input])
    @comment.recipe = @recipe
    @comment.user = current_user
    respond_to do |format|
      format.json
    end
  end
end
