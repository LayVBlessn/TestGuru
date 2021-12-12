class CreateResponces < ActiveRecord::Migration[6.1]
  def change
    create_table :responces do |t|
      t.boolean :correct, default: false
      t.string :body, null: false
      t.integer :question_id

      t.timestamps
    end
  end
end
