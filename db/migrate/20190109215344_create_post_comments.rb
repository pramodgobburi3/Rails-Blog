class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.integer :user_id
      t.text :body
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
