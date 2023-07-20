class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comment_entries, dependent: :destroy
    has_many :like_entries, dependent: :destroy
  
    def update_user_posts_counter
      author.update(post_counter: author.posts.count)
    end
  
    def recent_comments(limit = 5)
      comment_entries.order(created_at: :desc).limit(limit)
    end
  end
  