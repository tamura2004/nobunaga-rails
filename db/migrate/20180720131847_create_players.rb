class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :number
      t.string :color
      t.timestamps
    end
  end
end
