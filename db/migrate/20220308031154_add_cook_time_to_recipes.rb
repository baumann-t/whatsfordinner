class AddCookTimeToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :cooking_time, :string
  end
end
