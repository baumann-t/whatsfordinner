class AddUserRecipeToComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :user_recipe, foreign_key: true
  end
end
