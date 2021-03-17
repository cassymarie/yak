class CreateMlbTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :mlb_teams do |t|
      t.string :name
      t.string :venue
      t.string :city
      t.string :state
      t.string :division
      t.string :league
      t.string :base_url
      t.string :website_url
      t.string :timezone
      t.timestamps
    end
  end
end
