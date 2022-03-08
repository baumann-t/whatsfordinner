class RemoveInstructions < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :instructions
    add_column :recipes, :instructions, :string, array: true, default: []
  end
end
