class CreateMlbTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :mlb_teams do |t|
      t.string :name
      t.string :name_full
      t.string :venue
      t.string :city
      t.string :state
      t.string :division
      t.string :league
      t.string :logo
      t.string :color1
      t.string :color2
      t.string :website
      t.string :timezone
      t.timestamps
    end
  end
end
