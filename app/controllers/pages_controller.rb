class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    if user_signed_in?
      my_followees = current_user.list_followees
      @feed_items = FeedItem.where(user_id: my_followees).order(created_at: :desc)
    end
  end

  def search; end
end
