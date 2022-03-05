class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_recipes, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followers, class_name: 'Relation', foreign_key: 'follower_id', dependent: :destroy
  has_many :followees, class_name: 'Relation', foreign_key: 'followee_id', dependent: :destroy
  has_many :feed_items

  include PgSearch::Model
  pg_search_scope :search_by_first_name_last_name,
    against: [ :first_name, :last_name ],
    using: {
      tsearch: { prefix: true }
    }
  validates :email, uniqueness: true, presence: true
  validates :password, :first_name, :last_name, presence: true

  def follow(user_to_follow)
    Relation.create(follower: self, followee: user_to_follow)
  end

  def list_followers
    Relation.where(follower: self).map do |relation|
      followee_id = relation.followee_id
      User.find(followee_id)
    end
  end
end
