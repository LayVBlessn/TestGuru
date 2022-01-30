class AddColumnChallengeToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :challenge, :string
  end
end
