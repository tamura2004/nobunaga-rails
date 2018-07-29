class CreateRanks < ActiveRecord::Migration[5.2]
  def change
    create_table :ranks do |t|
      t.string :name
      t.integer :vp

      t.timestamps
    end
  end
end
