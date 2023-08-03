class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comment_entries, foreign_key: 'author_id', dependent: :destroy
  has_many :like_entries, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :three_recent_posts, ->(user) { user.posts.order(created_at: :desc).limit(3) }

  attribute :post_counter, :integer, default: 0

  # def all_posts_with_comments
  #   posts.includes(:comment_entries).order(created_at: :desc)
  # end
end
