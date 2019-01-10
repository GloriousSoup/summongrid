class AddTimesPokedToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :times_poked, :integer
  end
end
