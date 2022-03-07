class ConvertCategoriesToArray < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :categories, :string, array: true, default: []
  end
end
