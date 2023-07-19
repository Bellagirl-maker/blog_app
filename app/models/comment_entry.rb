class CommentEntry < ApplicationRecord
  belongs_to :author
  belongs_to :post
end
