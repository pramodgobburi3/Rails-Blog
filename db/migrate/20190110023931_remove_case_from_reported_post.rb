class RemoveCaseFromReportedPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :reported_posts, :cases
  end
end
