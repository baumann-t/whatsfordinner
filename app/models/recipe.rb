class Recipe < ApplicationRecord
  belongs_to :user
  has_many :user_recipes, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :photo
  validates :title, :description, :ingredients, :prep_time, :cooking_time, :instructions, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title],
    using: { tsearch: { prefix: true } }

  def self.from_recipe_to_user_recipe(recipe)
    UserRecipe.where(user_id: recipe.user, recipe_id: recipe.id).first
  end
end
