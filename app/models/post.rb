class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :comment_entries, dependent: :destroy

  validates :author, presence: true
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  after_create :update_user_post_counter

  def five_recent_comments
    comment_entries.order(created_at: :desc).limit(5)
  end

  private

  def update_user_post_counter
    author.increment!(:post_counter) if author.present?
  end
end
