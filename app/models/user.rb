class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_recipes, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :comments, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_first_name_last_name,
    against: [ :first_name, :last_name ],
    using: {
      tsearch: { prefix: true }
    }
end
