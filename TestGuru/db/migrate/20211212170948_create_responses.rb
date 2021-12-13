class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.string :correct, default: 'Yes', null: false
      t.references :question, foreign_key: true, null: false
      t.timestamps
    end
  end
end
