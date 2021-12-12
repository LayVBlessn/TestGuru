class CreateCathegories < ActiveRecord::Migration[6.1]
  def change
    create_table :cathegories do |t|
      t.string :title, null: false
      t.integer :question_id

      t.timestamps
    end
  end
end
