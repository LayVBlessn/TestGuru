class RemoveTimerFromTests < ActiveRecord::Migration[6.1]
  def change
    remove_column :tests, :timer, :boolean
  end
end
