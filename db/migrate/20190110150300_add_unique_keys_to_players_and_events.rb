class AddUniqueKeysToPlayersAndEvents < ActiveRecord::Migration[5.2]
  def change

    add_column :events, :key, :string
    add_column :players, :key, :string
  end
end
