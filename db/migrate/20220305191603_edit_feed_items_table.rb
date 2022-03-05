class EditFeedItemsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :feed_items, :type, :string
    remove_column :feed_items, :title, :string
    remove_column :feed_items, :content, :string
  end
end
