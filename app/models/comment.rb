class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  belongs_to :user_recipe
end
