class CreateLineups < ActiveRecord::Migration[6.1]
  def change
    create_table :lineups do |t|
      t.references :mlb_team
      t.references :user
      t.string :season
      t.timestamps
    end
  end
end
