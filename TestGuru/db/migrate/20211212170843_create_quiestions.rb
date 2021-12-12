class CreateQuiestions < ActiveRecord::Migration[6.1]
  def change
    create_table :quiestions do |t|
      t.string :body, null: false
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
