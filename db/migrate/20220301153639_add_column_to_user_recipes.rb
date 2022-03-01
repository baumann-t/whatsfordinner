class AddColumnToUserRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :user_recipes, :user_comment, :text
  end
end
