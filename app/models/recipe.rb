class Recipe < ApplicationRecord
  belongs_to :user
  has_many :user_recipes, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true }
    }


  validates :title, :description, :ingredients, :prep_time, :instructions, :category, presence: true
end
