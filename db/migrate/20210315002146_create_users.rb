class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name_first
      t.string :name_last
      t.references :mlb_team
      t.string :password_digest
      t.string :provider
      t.string :uid
      t.string :username
      t.timestamps
    end
  end
end
