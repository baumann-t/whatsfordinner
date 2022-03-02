class AddServingSizeToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :serving_size, :string
  end
end
