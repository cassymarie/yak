class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name_first
      t.string :name_last
      t.references :mlb_team
      t.string :password_digest
      t.string :username
      t.timestamps
    end
  end
end
