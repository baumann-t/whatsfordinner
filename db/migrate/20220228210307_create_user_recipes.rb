class CreateUserRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_recipes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.date :date_cooked
      t.boolean :cooked
      t.boolean :whishlisted

      t.timestamps
    end
  end
end
