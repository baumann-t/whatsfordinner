class CreateFeedItems < ActiveRecord::Migration[6.1]
  def change
    create_table :feed_items do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :user_recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
