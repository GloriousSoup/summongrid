class AddStatsToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :is_started, :boolean, default: true
    add_column :events, :game_starts_at, :datetime
    add_column :events, :game_started_at, :datetime
    add_column :events, :demon_mood, :string
  end
end
