class CreateReportedPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :reported_posts do |t|
      t.integer :reported_user_id
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
