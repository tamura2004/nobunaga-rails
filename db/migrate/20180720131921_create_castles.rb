class CreateCastles < ActiveRecord::Migration[5.2]
  def change
    create_table :castles do |t|
      t.string :country
      t.references :area
      t.string :name
      t.string :ability
      t.string :image
      t.integer :order
      t.references :owner, polymorphic: true, index: true
      t.timestamps
    end
  end
end
