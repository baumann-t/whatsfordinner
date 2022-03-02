class ChangeWhishlistedToWishlisted < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_recipes, :whishlisted, :wishlisted
  end
end
