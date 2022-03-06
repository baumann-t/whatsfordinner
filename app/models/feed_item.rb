class FeedItem < ApplicationRecord
  belongs_to :user
  belongs_to :user_recipe

  validates :item_type, inclusion: { in: %w(liked commented added cooked wishlisted), message: "type of feed item does not existe"}

  def creation_date
    self.created_at.strftime('%b %e, %l :%M')
  end
end
