class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :mlb_team_id
      t.boolean :custom_team
      t.references :C, index: false, foreign_key: {to_table: :players}
      t.references :B1, index: false, foreign_key: {to_table: :players}
      t.references :B2, index: false, foreign_key: {to_table: :players}
      t.references :B3, index: false, foreign_key: {to_table: :players}
      t.references :SS, index: false, foreign_key: {to_table: :players}
      t.references :OF1, index: false, foreign_key: {to_table: :players}
      t.references :OF2, index: false, foreign_key: {to_table: :players}
      t.references :OF3, index: false, foreign_key: {to_table: :players}
      t.references :DH, index: false, foreign_key: {to_table: :players}
      t.references :user
      t.timestamps
    end
  end
end
