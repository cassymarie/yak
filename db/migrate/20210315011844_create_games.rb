class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.references :mlb_team
      t.references :user
      t.references :lineup
      t.boolean :home
      t.string :matchup
      t.timestamps
    end
  end
end
