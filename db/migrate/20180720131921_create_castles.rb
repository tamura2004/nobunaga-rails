class CreateCastles < ActiveRecord::Migration[5.2]
  def change
    create_table :castles do |t|
      t.integer :number
      t.string :name
      t.string :area
      t.string :country
      t.string :ability
      t.references :owner, polymorphic: true, index: true
      t.timestamps
    end
  end
end
