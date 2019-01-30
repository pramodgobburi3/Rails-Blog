class AddCaseToReportedPost < ActiveRecord::Migration[5.2]
  def change
    add_column :reported_posts, :cases, :integer
  end
end
