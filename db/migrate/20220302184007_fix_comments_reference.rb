class FixCommentsReference < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :recipes_id
    add_reference :comments, :recipe, foreign_key: true
  end
end
