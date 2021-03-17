class CreateMlbPlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :mlb_players do |t|
      t.string :position_txt
      t.integer :position_num
      t.string :jersey_number
      t.string :first_name
      t.string :last_name
      t.string :name_display_first_last
      t.string :bats
      t.string :throws
      t.datetime :debut_date
      t.string :status
      t.datetime :birth_date
      t.string :weight
      t.string :height_feet
      t.string :height_inches
      t.references :mlb_team
      t.timestamps
    end
  end
end
