class FeedController < ApplicationController
  def view
    my_followees = current_user.list_followees
    @feed_items = FeedItem.where(user_id: my_followees)

  end
end
