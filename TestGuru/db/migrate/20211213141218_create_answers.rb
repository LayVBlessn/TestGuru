class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.boolean :correct, null: false, default: true
      t.string :title, null: false
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
