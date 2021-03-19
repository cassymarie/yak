class CreateLineupPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :lineup_players do |t|
      t.string :position
      t.references :mlb_player
      t.references :lineup
      t.timestamps
    end
  end
end
