class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new(content: params[:input])
    @comment.recipe = @recipe
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        comment = { comment: "<li> #{current_user.first_name} - #{@comment.content} </li>"  }
        format.json { render :json => comment }
      end
    end
  end
end
