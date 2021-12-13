class CreateRenameResponseToAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :rename_response_to_answers do |t|
      rename_table :responses, :answers

      t.timestamps
    end
  end
end
