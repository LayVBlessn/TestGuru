class CreateResponces < ActiveRecord::Migration[6.1]
  def change
    create_table :responces do |t|
      t.string :correct, default: 'Yes'

      t.timestamps
    end
  end
end
