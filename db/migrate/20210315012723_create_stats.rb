class CreateStats < ActiveRecord::Migration[6.1]
  def change
    create_table :stats do |t|
      t.references :mlb_player
      t.references :mlb_team
      t.references :game
      t.references :lineup
      t.integer :inning
      t.integer :hit
      t.integer :k
      t.integer :bb 
      t.integer :rbi
      t.integer :runs
      t.timestamps
    end
  end
end
