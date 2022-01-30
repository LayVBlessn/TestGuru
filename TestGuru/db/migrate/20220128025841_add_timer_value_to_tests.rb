class AddTimerValueToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :timer_value, :integer, default: 0
  end
end
