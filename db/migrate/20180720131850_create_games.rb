class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :players_number
      t.integer :turn
      t.string :step
      t.references :player

      t.timestamps
    end
  end
end
