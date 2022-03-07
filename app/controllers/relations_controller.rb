class RelationsController < ApplicationController
  before_action :authenticate_user!

  def follow
    relation = Relation.new
    relation.follower = current_user
    @user = User.find(params[:user_id])
    relation.followee = @user
    if relation.save
      redirect_to user_cookbook_path(@user)
    end
  end

  def unfollow
    relation = Relation.where(follower_id: current_user.id, followee_id: params[:user_id]).first
    @user = User.find(params[:user_id])
    redirect_to user_cookbook_path(@user) if relation.delete
  end

  def my_profile
    @user = current_user
  end

  def following
    @user = current_user
    @followees = @user.list_followees
  end
end
