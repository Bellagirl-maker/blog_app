class CreateLikeEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :like_entries do |t|
      t.references :author, foreign_key: { to_table: :users }
      t.references :post, foreign_key: { to_table: :posts }
      t.timestamps
    end
  end
end
