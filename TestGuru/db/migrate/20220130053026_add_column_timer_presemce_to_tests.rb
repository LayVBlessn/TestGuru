class AddColumnTimerPresemceToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :timer_presence, :boolean, default: false
  end
end
