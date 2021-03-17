class CreateStats < ActiveRecord::Migration[6.1]
  def change
    create_table :stats do |t|
      t.references :player, index: true
      t.references :team, index: true
      t.references :game, index: true
      t.integer :inning
      t.integer :hit
      t.integer :k
      t.integer :bb 
      t.integer :rbi
      t.integer :runs
      t.timestamps
    end
  end
end
