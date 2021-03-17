class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :mlb_id
      t.string :season
      t.references :user
      t.boolean :custom_team
      t.string :custom_team_name
      t.timestamps
    end
  end
end
