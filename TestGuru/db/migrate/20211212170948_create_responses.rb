class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.string :body, default: 'Yes'
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
