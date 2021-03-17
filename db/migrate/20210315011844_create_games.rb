class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.references :away, index: true, foreign_key: {to_table: :teams}
      t.references :home, index: true, foreign_key: {to_table: :teams}
      t.timestamps
    end
  end
end
