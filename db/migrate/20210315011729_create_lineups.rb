class CreateLineups < ActiveRecord::Migration[6.1]
  def change
    create_table :lineups do |t|
      t.string :pos1
      t.string :pos2
      t.string :pos3
      t.string :pos4
      t.string :pos5
      t.string :pos6
      t.string :pos7
      t.string :pos8
      t.string :pos9
      t.references :mlb_team
      t.references :user
      t.string :season
      t.timestamps
    end
  end
end
