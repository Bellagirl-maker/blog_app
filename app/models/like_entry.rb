class LikeEntry < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def increment_post_likes_counter
    post.increment!(:likes_counter)
  end
end
