class AddBodyToCommentEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :comment_entries, :body, :text
  end
end
