class User < ApplicationRecord
    has_many :posts, foreign_key: 'author_id', dependent: :destroy
    has_many :comment_entries, foreign_key: 'author_id', dependent: :destroy
    has_many :like_entries, foreign_key: 'author_id', dependent: :destroy
end
