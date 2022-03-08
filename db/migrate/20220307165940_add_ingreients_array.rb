class AddIngreientsArray < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :ingredients, :string, array: true, default: []
  end
end
