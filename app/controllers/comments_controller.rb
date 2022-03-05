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
        comment = { comment: "<li class='comment-list'> #{current_user.first_name} - <em>#{@comment.content}</em></li><hr>" }
        format.json { render :json => comment }
      end
    end
  end
end
