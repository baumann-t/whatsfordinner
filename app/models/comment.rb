class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  belongs_to :user_recipe

  def created_at_formated
    self.created_at.strftime('%b %e, %l:%M %p')
  end
end
