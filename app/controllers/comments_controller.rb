class CommentsController < ApplicationController
  def create
    @user_recipe = UserRecipe.find(params[:user_recipe].to_i)
    @recipe = @user_recipe.recipe
    @comment = Comment.new(content: params[:input])
    @comment.recipe = @recipe
    @comment.user_recipe = @user_recipe

    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        FeedItem.create(item_type: "commented", user_recipe_id:@user_recipe.id, user_id: current_user.id)
        format.text { render partial: 'shared/comment_partial', locals: { current_user: current_user, comment: @comment, recipe: @recipe }, formats: [:html] }
      end
    end
  end

  def delete
    @comment = Comment.find(params[:comment_id])
    if @comment.delete
      respond_to do |format|
        comment = { delete: @comment.id }
        format.json { render :json => comment }
      end
    end
  end
end
