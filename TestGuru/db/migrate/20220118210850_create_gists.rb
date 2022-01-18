# frozen_string_literal: true

class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.string :url, null: false
      t.references :creator, foreign_key: { to_table: :users }
      t.references :question, foreign_key: true
      t.timestamps
    end
  end
end
