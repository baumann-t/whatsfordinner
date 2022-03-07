class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    if user_signed_in?
      my_followees = current_user.list_followees_id
      @feed_items = FeedItem.where(user_id: my_followees).includes(:user_recipe).includes(:user).order(created_at: :desc)
    end
  end

  def search; end
end
