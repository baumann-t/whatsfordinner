class AddUpvotesColumnToRecipe < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :upvotes, :integer
  end
end
