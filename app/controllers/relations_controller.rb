class RelationsController < ApplicationController
  def follow
    relation = Relation.new
    relation.follower = current_user
    @user = User.find(params[:user_id])
    relation.followee = @user
    if relation.save
      redirect_to user_cookbook_path(@user)
    end
  end
end
