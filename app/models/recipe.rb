class Recipe < ApplicationRecord
  belongs_to :user
  has_many :user_recipes, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, :description, :ingredients, :prep_time, :instructions, :category, presence: true
end
