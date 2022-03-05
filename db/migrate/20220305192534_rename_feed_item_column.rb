class RenameFeedItemColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column(:feed_items, :type, :item_type)
  end
end
