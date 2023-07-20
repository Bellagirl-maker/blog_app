class CommentEntry < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  after_create :update_post_comments_counter

  def update_post_comments_counter
    post.increment!(:comments_counter)
  end
end
