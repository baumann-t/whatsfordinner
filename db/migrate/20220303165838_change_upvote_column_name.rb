class ChangeUpvoteColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :recipes, :upvotes, :upvotes_tracker
  end
end
