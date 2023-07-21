class CreateCommentEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_entries do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.references :post, foreign_key: { to_table: :posts }
      t.text :text
      t.timestamps
    end
  end
end
