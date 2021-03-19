class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.references :away, index: true, foreign_key: {to_table: :mlb_teams}
      t.references :home, index: true, foreign_key: {to_table: :mlb_teams}
      t.references :away_user, index: true, foreign_key: {to_table: :users}
      t.references :home_user, index: true, foreign_key: {to_table: :users}
      t.references :away_lineup, index: true, foreign_key: {to_table: :lineups}
      t.references :home_lineup, index: true, foreign_key: {to_table: :lineups}
      t.timestamps
    end
  end
end
