class UserRecipe < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  belongs_to :recipe
  has_many :feed_items

  pg_search_scope :recipe_title_search,
    associated_against: { recipe: [:title] },
    using: {
      tsearch: { prefix: true }
    }

  def mark_as_cooked!
    self.cooked = true
    self.date_cooked = Date.today
  end

  def user_recipe_status(recipe, user)
    wishlisted = false
    cooked = false
    cookbooked = false

    if recipe = UserRecipe.where(user_id: user.id, recipe_id: recipe.id).first
      cookbooked = true
      wishlisted = true if recipe.wishlisted
      cooked = true if recipe.cooked
    end

    if cooked
      return "cooked"
    elsif cookbooked
      return "cookbooked"
    elsif wishlisted
      return "wishlisted"
    else
      return "none"
    end
  end
end
