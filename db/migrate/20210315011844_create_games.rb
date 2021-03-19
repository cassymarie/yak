class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :away
      t.integer :home
      t.integer :away_user
      t.integer :home_user
      t.integer :away_lineup
      t.integer :home_lineup
      t.timestamps
    end
  end
end
