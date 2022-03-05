class CreateRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :relations do |t|
      t.references :follower, null: false
      t.references :followee, null: false

      t.timestamps
    end
    add_foreign_key :relations, :users, column: :follower_id, primary_key: :id
    add_foreign_key :relations, :users, column: :followee_id, primary_key: :id
  end
end
